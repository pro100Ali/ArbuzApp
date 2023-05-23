//
//  Product.swift
//  ArbuzAppSwiftUI
//
//  Created by Али  on 22.05.2023.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    var count: Double
    var isWeight: Bool
    var price: Int
    var amountInSclad: Double
}

struct BasketItem: Identifiable {
    let id = UUID()
    let product: Product
    var count: Double
    
}
