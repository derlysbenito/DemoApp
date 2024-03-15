//
//  HomeViewController.swift
//
//  Created by Derlys Hector Benito Baldeon on 8/02/24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.becomeFirstResponder()
        setupTextField()
        setupTableView()
        presenter?.doGetInfoRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: - UI
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupTextField(){
        searchTextField.delegate = self
    }
    
}

//MARK: - HomeViewProtocol

extension HomeViewController: HomeViewProtocol{
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

//MARK: - UITextFieldDelegate

extension HomeViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, text != ""{
            presenter?.searchByText(text: text)
        } else {
            presenter?.reloadArray()
        }
        
        return true
    }
    
}
