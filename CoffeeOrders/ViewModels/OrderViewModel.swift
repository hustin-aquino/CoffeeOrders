//
//  OrderViewModel.swift
//  CoffeeOrders
//
//  Created by Justin Bitancor (MDI Novare) on 9/24/24.
//

import Foundation

struct OrderListViewModel {
    var orderViewModelList: [OrderViewModel]
    
    init() {
        self.orderViewModelList = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.orderViewModelList[index]
    }
}

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    
    var name: String {
        return self.order.name
    }
    
    var email: String {
        return self.order.email
    }
    
    var type: String {
        return self.order.type.rawValue.capitalized
    }
    
    var size: String {
        return self.order.size.rawValue.capitalized
    }
}
