//
//  DetailView.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    var presenter: DetailPresenterProtocol?
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension DetailViewController: DetailViewProtocol{
    func refreshScreenData(model: PokemonResults?) {
        /*
         idLabel.text = "\(model?.id ?? 0)"
         userIdLabel.text = "\(model?.userId ?? 0)"
         titleLabel.text = model?.title
         bodyLabel.text = model?.body
         */
        
    }
}
