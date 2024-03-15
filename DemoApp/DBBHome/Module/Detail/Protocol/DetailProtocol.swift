//
//  DetailtProtocol.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation
import UIKit

protocol DetailRouterProtocol: AnyObject{
    func createModule(model: PokemonResults?) -> UIViewController
}

protocol DetailPresenterProtocol: AnyObject{
    var router: DetailRouterProtocol? { get set }
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorProtocol? { get set }
    var model: PokemonResults? { get set }
    
    func viewDidLoad()
}

protocol DetailViewProtocol: AnyObject{
    var presenter: DetailPresenterProtocol? { get set }
    
    func refreshScreenData(model: PokemonResults?)
}

protocol DetailInteractorProtocol: AnyObject{
    
}

