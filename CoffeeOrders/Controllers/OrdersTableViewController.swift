//
//  OrdersTableViewController.swift
//  CoffeeOrders
//
//  Created by Justin Bitancor (MDI Novare) on 9/24/24.
//

import Foundation
import UIKit


class OrdersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        guard let coffeeOrderURL = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
             fatalError("URL is incorrect")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrderURL)
        
        Webservice().load(resource: resource) { result in
            switch result {
                case .success(let orders):
                    print(orders)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
