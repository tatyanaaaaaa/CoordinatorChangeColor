//
//  DetailScreenInteractor.swift
//  CoordinatorChangeColor
//
//  Created by Tatiana Sosina on 26.04.2022.
//
import UIKit

protocol DetailScreenInteractorOutput: AnyObject {

}

protocol DetailScreenInteractorInput: AnyObject {
 
}

final class DetailScreenInteractor: DetailScreenInteractorInput {

    // MARK: - Internal property
    
    weak var output: DetailScreenInteractorOutput?
    
}
