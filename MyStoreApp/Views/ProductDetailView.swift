//
//  ProductDetailView.swift
//  MyStoreApp
//
//  Created by Chandan Kumar Dash on 01/04/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)

            Text(product.title)
                .font(.title)
                .padding()

            Text(product.description)
                .padding()

            Text("$\(product.price, specifier: "%.2f")")
                .font(.title2)
                .bold()

            Button(action: {
                cartManager.addToCart(product: product)
            }) {
                Text(cartManager.cartItems.contains(where: { $0.id == product.id }) ? "Remove from Cart" : "Add to Cart")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(cartManager.cartItems.contains(where: { $0.id == product.id }) ? Color.red : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}
