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
    
    private var pokemonDetailModel: PokemonDetail?
    
}

extension DetailPresenter: DetailPresenterProtocol{
    
    //MARK: - DataSource
    
    func doGetPokemonDetail() {
        interactor?.getPokemonDetail(identifier: model?.name ?? "", onCompletion: { [weak self] response in
            switch response.result{
            case .success(let dataInfo):
                self?.pokemonDetailModel = dataInfo
                self?.doSuccessGetPokemonDetail()
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func doSuccessGetPokemonDetail() {
        view?.refreshScreenData(model: pokemonDetailModel)
    }
    
    func doErrorGetPokemonDetail() {
        
    }
    
    
    
}
