//
//  ListIngredientsVC.swift
//  Cosmetic
//
//  Created by Nguyễn Đức Thọ on 8/27/21.
//

import UIKit
import CoreData

class ListIngredientsVC: UIViewController {
    
    var viewModel: ListIngredientsVMProtocol!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
    }
}

extension ListIngredientsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let data = viewModel.object(at: indexPath)
        cell.textLabel?.text = data.inci
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(section)
    }
}
