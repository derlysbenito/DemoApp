//
//  MainResponse.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 14/03/24.
//

import Foundation

struct MainResponse<T: Codable>: Codable{
    let count: Int?
    let results: [PokemonResults]?
}

