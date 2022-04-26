//
//  DetailScreenFactory.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//

import UIKit

protocol DetailScreenFactoryOutput: AnyObject {
    
}

protocol DetailScreenFactoryInput: AnyObject {
 
}

final class DetailScreenFactory: DetailScreenFactoryInput {

    // MARK: - Internal property
    
    weak var output: DetailScreenFactoryOutput?
    
}
