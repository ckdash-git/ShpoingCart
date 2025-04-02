//
//  MyStoreAppApp.swift
//  MyStoreApp
//
//  Created by Chandan Kumar Dash on 01/04/25.
//

import SwiftUI

@main
struct MyStoreAppApp: App {
    @StateObject var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager)
        }
    }
}


