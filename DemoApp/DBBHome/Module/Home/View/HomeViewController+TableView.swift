//
//  HomeViewController+TableView.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeItemCell", for: indexPath) as? HomeItemCell, let item = presenter?.infoItem(index: indexPath.row) else { return UITableViewCell() }
        
        cell.titleLabel.text = item.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(indexPath: indexPath)
    }
    
}

extension HomeViewController: UITableViewDelegate{
    
}

