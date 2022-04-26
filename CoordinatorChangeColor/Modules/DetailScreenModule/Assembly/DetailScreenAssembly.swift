//
//  DetailScreenAssembly.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//

import UIKit

final class DetailScreenAssembly {
    func createModule() -> DetailScreenModule {
        let view = DetailScreenView()
        let interactor = DetailScreenInteractor()
        let factory = DetailScreenFactory()
        let presenter = DetailScreenViewController(moduleView: view, interactor: interactor, factory: factory)
        
        view.output = presenter
        interactor.output = presenter
        factory.output = presenter
        return presenter
    }
}
