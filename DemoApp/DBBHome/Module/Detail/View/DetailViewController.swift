//
//  DetailView.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation
import UIKit
import SDWebImage

class DetailViewController: UIViewController{
    
    var presenter: DetailPresenterProtocol?
    
    @IBOutlet weak var imageViewPokemon: UIImageView!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelWith: UILabel!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        presenter?.doGetPokemonDetail()
        
    }
    
    //MARK: - UI
    
    private func setupNavigationBar(){
        self.title = "Detalle Pokemon"
    }
}

//MARK: - DetailViewProtocol

extension DetailViewController: DetailViewProtocol{
    
    func refreshScreenData(model: PokemonDetail?) {
        guard let imageURL = model?.sprites?.frontDefault else { return }
        imageViewPokemon.sd_setImage(with: URL(string: imageURL))
        labelWith.text = "weight: \(model?.weight ?? 0)"
        labelHeight.text = "height: \(model?.height ?? 0)"
    }

}
