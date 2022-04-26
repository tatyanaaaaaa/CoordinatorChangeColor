//
//  MainScreenModule.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//

import UIKit

protocol MainScreenModuleOutput: AnyObject {
    
    /// Срабатывает при нажатии на кнопку
    func switchDidButtonAction()
    
    /// Текст был получен
    /// - Parameter text: готовый текст
    func didRecive(text: String)
}

protocol MainScreenModuleInput: AnyObject {
    
    var moduleOutput: MainScreenModuleOutput? { get set }
}

typealias MainScreenModule = UIViewController & MainScreenModuleInput

final class MainScreenViewController: MainScreenModule {
    
    // MARK: - Internal property
    
    weak var moduleOutput: MainScreenModuleOutput?
    
    // MARK: - Private property
    
    private let moduleView: MainScreenViewInput & UIView
    private let interactor: MainScreenInteractorInput
    private let factory: MainScreenFactoryInput
    
    // MARK: - Initialization
    
    init(moduleView: MainScreenViewInput & UIView, interactor: MainScreenInteractorInput, factory: MainScreenFactoryInput) {
        self.moduleView = moduleView
        self.interactor = interactor
        self.factory = factory
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal func
    
    override func loadView() {
        super.loadView()
        view = moduleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Appearents().setTitle
    }
}

// MARK: - MainScreenViewOutput

extension MainScreenViewController: MainScreenViewOutput {
    func switchButtonAction() {
        moduleView.changeBackgroundColor()
        moduleOutput?.switchDidButtonAction()
        interactor.getContentText()
    }
}

// MARK: - MainScreenFactoryOutput

extension MainScreenViewController: MainScreenFactoryOutput {
    
}

// MARK: - MainScreenInteractorOutput

extension MainScreenViewController: MainScreenInteractorOutput {
    func didRecive(text: String) {
        moduleOutput?.didRecive(text: text)
    }
}

// MARK: - Private Appearents

private extension MainScreenViewController {
    struct Appearents {
        let setTitle = "Main screen"
    }
}
