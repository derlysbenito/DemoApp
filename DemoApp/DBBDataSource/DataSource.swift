//
//  DataSource.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 14/03/24.
//

import Foundation
import Alamofire

typealias PokemonsResultError = (DataResponse<MainResponse<PokemonResults>, AFError>) -> Void

typealias PokemonDetailResultError = (DataResponse<PokemonDetail, AFError>) -> Void

class DataSource{
    
    static let shared = DataSource()
    
    func requestGetInfo(callbackHandler: @escaping PokemonsResultError){
        
        AF.request("https://pokeapi.co/api/v2/pokemon?limit=100&offset=0", method: .get).responseDecodable(of: MainResponse.self) { (response) in
            callbackHandler(response)
        }
    }
    
    func getPokemonDetail(identifier: String,
                          callbackHandler: @escaping PokemonDetailResultError){
        AF.request("https://pokeapi.co/api/v2/pokemon/\(identifier)", method: .get).responseDecodable(of: PokemonDetail.self) { (response) in
            callbackHandler(response)
        }
    }
    
}
