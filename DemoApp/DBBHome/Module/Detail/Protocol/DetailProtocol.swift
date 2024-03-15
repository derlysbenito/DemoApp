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
    
    func doGetPokemonDetail()
    func doSuccessGetPokemonDetail()
    func doErrorGetPokemonDetail()
}

protocol DetailInteractorProtocol: AnyObject{
    func getPokemonDetail(identifier: String, onCompletion: @escaping PokemonDetailResultError)
}

protocol DetailViewProtocol: AnyObject{
    var presenter: DetailPresenterProtocol? { get set }
    
    func refreshScreenData(model: PokemonDetail?)
}

