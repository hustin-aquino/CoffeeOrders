//
//  OrdersTableViewController.swift
//  CoffeeOrders
//
//  Created by Justin Bitancor (MDI Novare) on 9/24/24.
//

import Foundation
import UIKit


class OrdersTableViewController: UITableViewController {
    
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        guard let coffeeOrderURL = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
             fatalError("URL is incorrect")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrderURL)
        
        Webservice().load(resource: resource) { [weak self] result in
            switch result {
                case .success(let orders):
                    self?.orderListViewModel.orderViewModelList = orders.map(OrderViewModel.init)
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.orderViewModelList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
        
        return cell
    }
}
