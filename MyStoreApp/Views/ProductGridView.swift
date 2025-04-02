//
//  ProductGridView.swift
//  MyStoreApp
//
//  Created by Chandan Kumar Dash on 01/04/25.
//

import SwiftUI

struct ProductGridView: View {
    @StateObject var networkManager = NetworkManager()
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(networkManager.products) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductCardView(product: product)
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                networkManager.fetchProducts()
            }
            .navigationTitle("Products")
            .toolbar {
                NavigationLink(destination: CartView(cartManager: _cartManager)) {
                    Image(systemName: "cart")
                        .overlay(
                            Text("\(cartManager.cartItems.count)")
                                .font(.caption)
                                .foregroundColor(.white)
                                .background(Circle().fill(Color.red).frame(width: 18, height: 18))
                                .offset(x: 10, y: -10),
                            alignment: .topTrailing
                        )
                }
            }
        }
    }
}
