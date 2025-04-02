//
//  ContentView.swift
//  MyStoreApp
//
//  Created by Chandan Kumar Dash on 01/04/25.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var cart = Cart()
    @StateObject var cartManager = CartManager()

    var body: some View {
        TabView {
            ProductGridView()
                .tabItem {
                    Label("Shop", systemImage: "cart")
                }
            
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }
        }
        .environmentObject(cartManager)
    }
}
