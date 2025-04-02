//
//  NetworkManager.swift
//  MyStoreApp
//
//  Created by Chandan Kumar Dash on 01/04/25.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var products: [Product] = []

    func fetchProducts() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([Product].self, from: data)
                    DispatchQueue.main.async {
                        self.products = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}
