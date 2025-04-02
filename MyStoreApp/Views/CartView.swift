//
//  CartView.swift
//  MyStoreApp
//
//  Created by Chandan Kumar Dash on 01/04/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var showAlert = false

    var body: some View {
        VStack {
            List {
                ForEach(cartManager.cartItems) { item in
                    HStack {
                        AsyncImage(url: URL(string: item.image)) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)

                        VStack(alignment: .leading) {
                            Text(item.title).font(.headline)
                            Text("$\(item.price, specifier: "%.2f")").font(.subheadline)
                        }
                    }
                }
            }

            Button(action: {
                cartManager.cartItems.removeAll()
                showAlert = true
            }) {
                Text("Checkout")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) { // Show the alert when showAlert is true
                            Alert(
                                title: Text("Thank you!"),
                                message: Text("Your order has been placed."),
                                dismissButton: .default(Text("OK"))
                            )
                        }
        }
        .navigationTitle("Cart")
    }
}
