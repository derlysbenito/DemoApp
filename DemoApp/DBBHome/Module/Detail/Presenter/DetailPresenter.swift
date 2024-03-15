//
//  DetailPresenter.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation

class DetailPresenter{
    
    var router: DetailRouterProtocol?
    var interactor: DetailInteractorProtocol?
    var model: PokemonResults?
    weak var view: DetailViewProtocol?
    
}

extension DetailPresenter: DetailPresenterProtocol{
    
    func viewDidLoad() {
        view?.refreshScreenData(model: self.model)
    }
    
}
