//
//  DetailScreenView.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//

import UIKit

protocol DetailScreenViewOutput: AnyObject {
 
    func switchButtonAction()
}

protocol DetailScreenViewInput: AnyObject {
    
    func set(text: String)
    
    func changeBackgroundColor()
}

final class DetailScreenView: UIView & DetailScreenViewInput {
    
    
    weak var output: DetailScreenViewOutput?
    
    private let textLabel = UILabel()
    private let switchButton = UIButton()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupDefaultSettings()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(text: String) {
        textLabel.text = text
    }
    
    public func changeBackgroundColor() {
        backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1), alpha: 1)
    }
    
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


extension DetailScreenView {
    struct Appearents {
        let setTextButton = "Закрыть экран"
        let padding: CGFloat = 30
    }
}
