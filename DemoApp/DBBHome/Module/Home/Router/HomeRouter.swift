//
//  HomeRouter.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation
import UIKit

class HomeRouter{
    
    public var coordinator: HomeCoordinator?
    
    required init(coordinator: HomeCoordinator?) {
        self.coordinator = coordinator
    }
    
}

extension HomeRouter: HomeRouterProtocol{
    
    var mainStoryBoard: UIStoryboard{
        return UIStoryboard(name: "Home", bundle: Bundle.main)
    }
    
    func createModule() -> UIViewController {
        guard let vc = mainStoryBoard.instantiateViewController(withIdentifier: "HomeVC")
                as? HomeViewController else { return UIViewController() }
        
        let presenter = HomePresenter()
        let interactor = HomeInteractor(dataSource: DataSource.shared)
        
        presenter.router = self
        presenter.view = vc
        presenter.interactor = interactor
        
        vc.presenter = presenter
        return vc
    }
    
    func navigateToHomeDetail(item: PokemonResults) {
        let homeDetailRouter = DetailRouter(coordinator: coordinator)
        let vc = homeDetailRouter.createModule(model: item)
        coordinator?.presenter?.pushViewController(viewController: vc, animate: true)
    }
    
}
