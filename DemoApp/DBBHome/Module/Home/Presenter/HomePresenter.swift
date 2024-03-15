//
//  HomePresenter.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation

class HomePresenter{
    
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol?
    weak var view: HomeViewProtocol?
    
    private var infoModelArray: [PokemonResults] = []
    private var infoModelArrayFilter : [PokemonResults] = []
    
}

extension HomePresenter: HomePresenterProtocol{
    
    //MARK: - DataSource
    
    func doGetInfoRequest() {
        interactor?.getInfoRequest(onCompletion: { [weak self] response in
            switch response.result{
            case .success(let dataInfo):
                if let data = dataInfo.results{
                    self?.didReceivedInfoSuccess(response: data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func didReceivedInfoSuccess(response: [PokemonResults]) {
        infoModelArray = response
        infoModelArrayFilter = response
        view?.reloadTableView()
    }
    
    func didReceivedInfoError() {
        
    }
    
    //MARK: - TableView
    
    func infoItem(index: Int) -> PokemonResults {
        return infoModelArrayFilter[index]
    }
    
    func numberOfRows() -> Int {
        return infoModelArrayFilter.count
    }
    
    func searchByText(text: String) {
        let filter = infoModelArray.filter{ ($0.name?.lowercased() ?? "").contains(text.lowercased()) }
        infoModelArrayFilter = filter
        view?.reloadTableView()
    }
    
    func reloadArray() {
        infoModelArrayFilter = infoModelArray
        view?.reloadTableView()
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        let item = infoModelArrayFilter[indexPath.row]
        goToHomeDetail(item: item)
        
    }
    
    //MARK: - Navigation
    
    func goToHomeDetail(item: PokemonResults) {
        router?.navigateToHomeDetail(item: item)
    }
}
