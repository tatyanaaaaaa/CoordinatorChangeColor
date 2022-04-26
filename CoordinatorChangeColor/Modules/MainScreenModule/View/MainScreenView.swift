//
//  MainScreenView.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//

import UIKit

protocol MainScreenViewOutput: AnyObject {
    
    /// Пользователь нажал на кнопку
    func switchButtonAction()
}

protocol MainScreenViewInput: AnyObject {
    
    /// Установить текст
    /// - Parameter text: текст
    func set(text: String)
    
    /// Изменение цвета экрана на рандомный
    func changeBackgroundColor()
}

final class MainScreenView: UIView & MainScreenViewInput {
    
    // MARK: - Internal property
    
    weak var output: MainScreenViewOutput?
    
    // MARK: - Private property
    
    private let textLabel = UILabel()
    private let switchButton = UIButton()
    
    // MARK: - Internal func
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupDefaultSettings()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public func
    
    public func set(text: String) {
        textLabel.text = text
    }
    
    public func changeBackgroundColor() {
        backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1), alpha: 1)
    }
    
    // MARK: - Private func
    
    private func setupDefaultSettings() {
        backgroundColor = .white
        
        textLabel.textColor = .red
        switchButton.setTitleColor(.blue, for: .normal)
        switchButton.setTitle(Appearents().setTextButton, for: .normal)
        switchButton.addTarget(self, action: #selector(switchButtonAction), for: .touchUpInside)
    }
    
    @objc private func switchButtonAction() {
        output?.switchButtonAction()
    }
    
    private func setupConstraints() {
        [textLabel, switchButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Appearents().padding),
            
            switchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            switchButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

// MARK: - Private Appearents

private extension MainScreenView {
    struct Appearents {
        let setTextButton = "Нажать, для перехода на следующий экран"
        let padding: CGFloat = 30
    }
}
