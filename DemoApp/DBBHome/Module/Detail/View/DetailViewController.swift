//
//  DetailView.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    var presenter: DetailPresenterProtocol?
    
    @IBOutlet weak var imageViewPokemon: UIImageView!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelWith: UILabel!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.doGetPokemonDetail()
        
    }
}

//MARK: - DetailViewProtocol

extension DetailViewController: DetailViewProtocol{
    
    func refreshScreenData(model: PokemonDetail?) {
        labelWith.text = "weight: \(model?.weight ?? 0)"
        labelHeight.text = "height: \(model?.height ?? 0)"
    }

}
