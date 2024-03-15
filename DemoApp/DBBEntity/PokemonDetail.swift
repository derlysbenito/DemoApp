//
//  PokemonDetail.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 15/03/24.
//

import Foundation

struct PokemonDetail: Codable{
    let id: Int?
    let height: Int?
    let weight: Int?
    let sprites: Sprites?
}

struct Sprites: Codable{
    let frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
