//
//  DetailScreenView.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//

import UIKit

protocol DetailScreenViewOutput: AnyObject {
 
    /// Кнопка нажата пользователем
    func switchButtonAction()
}

protocol DetailScreenViewInput: AnyObject {
    
    /// Устанавливает текст
    /// - Parameter text: текст на экранe
    func set(text: String)
}

final class DetailScreenView: UIView & DetailScreenViewInput {
    
    // MARK: - Internal property
    
    weak var output: DetailScreenViewOutput?
    
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

private extension DetailScreenView {
    struct Appearents {
        let setTextButton = "Закрыть экран"
        let padding: CGFloat = 30
    }
}
