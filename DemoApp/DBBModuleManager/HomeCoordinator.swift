//
//  HomeCoordinator.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation

class HomeCoordinator: HomeCoordinatorProtocol{
    
    var presenter: MainPresenterProtocol?
    
    required init(presenter: MainPresenterProtocol?) {
        self.presenter = presenter
    }
    
    func start() {
        
    }
    
    func presentHomeModule() {
        let router = HomeRouter(coordinator: self)
        let vc = router.createModule()
        presenter?.setViewControllers(viewControllers: [vc], animated: false)
    }
}
