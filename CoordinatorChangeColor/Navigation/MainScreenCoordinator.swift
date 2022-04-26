//
//  MainScreenCoordinator.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//

import UIKit

final class MainScreenCoordinator: Coordinator {
    
    // MARK: - Private property
    
    private let navigationController: UINavigationController
    private var detailScreenCoordinator: DetailScreenCoordinatorProtocol?
    
    // MARK: - Initialization
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal func
    
    func start() {
        let mainScreenModule = MainScreenAssembly().createModule()
        mainScreenModule.moduleOutput = self
        navigationController.pushViewController(mainScreenModule, animated: true)
    }
    
    // MARK: - Private func
    
    private func showDetailScreen() {
        let detailScreenCoordinator: DetailScreenCoordinatorProtocol = DetailScreenCoordinator(navigationController: navigationController)
        self.detailScreenCoordinator = detailScreenCoordinator
        detailScreenCoordinator.start()
    }
}

// MARK: - MainScreenModuleOutput

extension MainScreenCoordinator: MainScreenModuleOutput {
    func didRecive(text: String) {
        detailScreenCoordinator?.setTitle(text: text)
    }
    
    func switchDidButtonAction() {
        showDetailScreen()
    }
}
