//
//  MainScreenInteractor.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//

import UIKit

protocol MainScreenInteractorOutput: AnyObject {
    
    /// Данные были получены и изменены
    /// - Parameter text: готовый текст
    func didRecive(text: String)
}

protocol MainScreenInteractorInput: AnyObject {
    
    /// Получить данные
    func getContentText()
}

final class MainScreenInteractor: MainScreenInteractorInput {
    
    // MARK: - Internal property
    
    weak var output: MainScreenInteractorOutput?
    
    // MARK: - Internal func
    
    func getContentText() {
        output?.didRecive(text: Appearents().setText)
    }
}

// MARK: - Private Appearents

private extension MainScreenInteractor {
    struct Appearents {
        let setText = "Good"
    }
}
