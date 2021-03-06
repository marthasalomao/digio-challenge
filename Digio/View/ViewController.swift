//
//  ViewController.swift
//  Digio
//
//  Created by Martha R on 16/11/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var content: Content?
    var service = Service()

    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadContent()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ContentTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "tableViewCell")
    }
    
    // MARK: - Methods 
    func loadContent() {
        service.request(router: Router.content) { (result: Result<Content>) in
            switch result {
            case .success(let content):
                self.content = content
                self.tableView.reloadData()
            case .failure:
                self.showAlert()
            }
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Ops, algo deu errado",
                                      message: "Você gostaria de tentar novamente?",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Tentar novamente",
                                      style: .default, handler: { action in
                                        self.loadContent()
        }))
        self.present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell",
                                                       for: indexPath) as? ContentTableViewCell else {
                                                        return UITableViewCell()
        }
        
        if let content = content {
            if indexPath.row == 0 {
                cell.prepare(contents: content, type: .spotlight)
            } else if indexPath.row == 1 {
                cell.prepare(contents: content, type: .cash)
            } else {
                cell.prepare(contents: content, type: .product)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 { return 80 }
        return 180
    }
}

