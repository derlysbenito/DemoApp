//
//  MainProtocol.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation
import UIKit

protocol HomeRouterProtocol: AnyObject{
    func createModule() -> UIViewController
    func navigateToHomeDetail(item: PokemonResults)
}

protocol HomePresenterProtocol: AnyObject{
    var router: HomeRouterProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var view: HomeViewProtocol? { get set }
    
    func doGetInfoRequest()
    func didReceivedInfoSuccess(response: [PokemonResults])
    func didReceivedInfoError()
    func infoItem(index: Int) -> PokemonResults
    
    func numberOfRows() -> Int
    
    func searchByText(text: String)
    func reloadArray()
    func didSelectRowAt(indexPath: IndexPath)
    
    func goToHomeDetail(item: PokemonResults)

}

protocol HomeInteractorProtocol: AnyObject{
    func getInfoRequest(onCompletion: @escaping PokemonsResultError)
}

protocol HomeViewProtocol: AnyObject{
    var presenter: HomePresenterProtocol? { get set }
    
    func reloadTableView()
    
}
