//
//  ViewController.swift
//  StartMVVM
//
//  Created by DSCO on 7/9/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let viewModel = ItemsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.fetchData()
    }
    
    func bindViewModel() {
        viewModel.items.bind { [weak self] _ in
            guard let self = self else {return}
            self.tableView.reloadData()
        }
    }
    
}

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberItems()
    }
}

