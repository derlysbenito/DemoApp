//
//  HomeInteractor.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation

class HomeInteractor{
    
    let dataSource : DataSource?
    
    required init(dataSource: DataSource?) {
        self.dataSource = dataSource
    }
    
}

extension HomeInteractor: HomeInteractorProtocol{
    
    func getInfoRequest(onCompletion: @escaping PokemonsResultError) {
        dataSource?.requestGetInfo { response in
            onCompletion(response)
        }
    }
}
