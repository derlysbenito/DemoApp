//
//  CoordinatorProtocol.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation

public protocol CoordinatorProtocol{
    var presenter : MainPresenterProtocol? { get set }
    func start()
    
}
