//
//  Order.swift
//  CoffeeOrders
//
//  Created by Justin Bitancor (MDI Novare) on 9/24/24.
//

import Foundation

enum CoffeeType: String, Codable {
    case cappuccino
    case latte
    case espresso
    case cortado
}

enum CoffeeSize: String, Codable {
    case small
    case medium
    case large
}

struct Order: Codable {
    
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
    
}
