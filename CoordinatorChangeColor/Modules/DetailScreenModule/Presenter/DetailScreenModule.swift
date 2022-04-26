//
//  DetailScreenModule.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//

import UIKit

protocol DetailScreenModuleOutput: AnyObject {
    
    /// Закрыть текущий экран
    func clouseScreen()
}

protocol DetailScreenModuleInput: AnyObject {
    
    /// Устанавливает текст
    /// - Parameter text: текст на экранe
    func setTitle(text: String)
    
    var moduleOutput: DetailScreenModuleOutput? { get set }
}

typealias DetailScreenModule = UIViewController & DetailScreenModuleInput

final class DetailScreenViewController: DetailScreenModule {
  
    // MARK: - Internal property
    
    weak var moduleOutput: DetailScreenModuleOutput?
    
    // MARK: - Private property
    
    private let moduleView: DetailScreenViewInput & UIView
    private let interactor: DetailScreenInteractorInput
    private let factory: DetailScreenFactoryInput
    
    // MARK: - Initialization
    
    init(moduleView: DetailScreenViewInput & UIView, interactor: DetailScreenInteractorInput, factory: DetailScreenFactoryInput) {
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
    
   func setTitle(text: String) {
        moduleView.set(text: text)
    }
}

// MARK: - DetailScreenViewOutput

extension DetailScreenViewController: DetailScreenViewOutput {
    
    func switchButtonAction() {
        moduleOutput?.clouseScreen()
    }
}

// MARK: - DetailScreenFactoryOutput

extension DetailScreenViewController: DetailScreenFactoryOutput {
    
}

// MARK: - DetailScreenInteractorOutput

extension DetailScreenViewController: DetailScreenInteractorOutput {
  
}

// MARK: - Private Appearents

private extension DetailScreenViewController {
    struct Appearents {
        let setTitle = "Detail screen"
    }
}
