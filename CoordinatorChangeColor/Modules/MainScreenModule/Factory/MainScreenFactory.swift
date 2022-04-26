//
//  MainScreenFactory.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//

import UIKit

protocol MainScreenFactoryOutput: AnyObject {
    
}

protocol MainScreenFactoryInput: AnyObject {
    
}

final class MainScreenFactory: MainScreenFactoryInput {
    
    // MARK: - Internal property
    
    weak var output: MainScreenFactoryOutput?
}
