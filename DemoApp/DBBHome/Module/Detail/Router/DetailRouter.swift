//
//  DetailRouter.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation
import UIKit

class DetailRouter{
    
    var coordinator: HomeCoordinator?
    
    required init(coordinator: HomeCoordinator?) {
        self.coordinator = coordinator
    }
    
}

extension DetailRouter: DetailRouterProtocol{
    
    var mainStoryBoard : UIStoryboard{
        return UIStoryboard(name: "Detail", bundle: Bundle.main)
    }
    
    func createModule(model: PokemonResults?) -> UIViewController {
        guard let vc = mainStoryBoard.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController else { return UIViewController() }
        
        let presenter = DetailPresenter()
        presenter.interactor = DetailInteractor(dataSource: DataSource.shared)
        presenter.router = self
        presenter.view = vc
        presenter.model = model
        
        vc.presenter = presenter
        return vc
    }
    
}
