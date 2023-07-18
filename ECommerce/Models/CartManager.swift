//
//  CartManager.swift
//  ECommerce
//
//  Created by rahul kaushik on 18/07/23.
//

import Foundation

class CartManager: ObservableObject {
    @Published private (set) var products: [Product] = []
    @Published private (set) var total: Float = 0
                                                        
    func addToCart (product: Product) {
        products.append (product)
        total += product.price
    }
                                                        
    func removeFromCart (product: Product) {
        products = products.filter{ $0.id != product.id}
        total -= product.price
    }
}
                                                    
