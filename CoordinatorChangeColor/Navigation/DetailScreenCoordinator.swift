//
//  DetailScreenCoordinator.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//

import UIKit

protocol DetailScreenCoordinatorInput: AnyObject {
    
    /// Устанавливает текст
    /// - Parameter text: текст на экранe
    func setTitle(text: String)
}

typealias DetailScreenCoordinatorProtocol = Coordinator & DetailScreenCoordinatorInput

final class DetailScreenCoordinator: DetailScreenCoordinatorProtocol  {
    
    // MARK: - Private property
    
    private let navigationController: UINavigationController
    private var detailScreenModule: DetailScreenModule?
    
    // MARK: - Initialization
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal func
    
    func start() {
        let detailScreenModule = DetailScreenAssembly().createModule()
        detailScreenModule.moduleOutput = self
        self.detailScreenModule = detailScreenModule
        navigationController.pushViewController(detailScreenModule, animated: true)
    }
    
    func setTitle(text: String) {
        detailScreenModule?.setTitle(text: text)
    }
}

// MARK: - DetailScreenModuleOutput

extension DetailScreenCoordinator: DetailScreenModuleOutput {
    func clouseScreen() {
        navigationController.popViewController(animated: true)
    }
}


