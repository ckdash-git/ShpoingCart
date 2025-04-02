//
//  ProductCardView.swift
//  MyStoreApp
//
//  Created by Chandan Kumar Dash on 01/04/25.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 150)

            Text(product.title)
                .font(.headline)
                .lineLimit(1)

            Text("$\(product.price, specifier: "%.2f")")
                .font(.subheadline)
            
            

            Button(action: {
                cartManager.addToCart(product: product)
            }) {
                Image(systemName: cartManager.cartItems.contains(where: { $0.id == product.id }) ? "heart.fill" : "heart")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
