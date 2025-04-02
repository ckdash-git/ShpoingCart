//
//  Cart.swift
//  MyStoreApp
//
//  Created by Chandan Kumar Dash on 01/04/25.
//

import Foundation

class Cart: ObservableObject {
    @Published var cartItems: [Product] = []

    func addToCart(product: Product) {
        if cartItems.contains(where: { $0.id == product.id }) {
            cartItems.removeAll { $0.id == product.id }
        } else {
            cartItems.append(product)
        }
    }
}
