//
//  MainScreenModule.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//

import UIKit

protocol MainScreenModuleOutput: AnyObject {
    
}

protocol MainScreenModuleInput: AnyObject {
    
    var moduleOutput: MainScreenModuleOutput? { get set }
}

typealias MainScreenModule = UIViewController & MainScreenModuleInput

final class MainScreenViewController: MainScreenModule {
    
    weak var moduleOutput: MainScreenModuleOutput?
    
    private let moduleView: MainScreenViewInput & UIView
    private let interactor: MainScreenInteractorInput
    private let factory: MainScreenFactoryInput
    
    init(moduleView: MainScreenViewInput & UIView, interactor: MainScreenInteractorInput, factory: MainScreenFactoryInput) {
        self.moduleView = moduleView
        self.interactor = interactor
        self.factory = factory
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = moduleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.getContentText()
    }
}


extension MainScreenViewController: MainScreenViewOutput {
    func switchButtonAction() {
        moduleView.changeBackgroundColor()
    }
}

extension MainScreenViewController: MainScreenFactoryOutput {
    
}

extension MainScreenViewController: MainScreenInteractorOutput {
    func didRecive(text: String) {
        moduleView.set(text: text)
    }
    
    
}
