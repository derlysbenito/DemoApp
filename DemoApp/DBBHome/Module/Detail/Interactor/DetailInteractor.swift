//
//  DetailInteractorProtocol.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation

class DetailInteractor{
    let dataSource : DataSource?
    
    required init(dataSource: DataSource?) {
        self.dataSource = dataSource
    }
}

extension DetailInteractor: DetailInteractorProtocol{
    func getPokemonDetail(identifier: String, onCompletion: @escaping PokemonDetailResultError) {
        dataSource?.getPokemonDetail(identifier: identifier, callbackHandler: { response in
            onCompletion(response)
        })
    }
}
