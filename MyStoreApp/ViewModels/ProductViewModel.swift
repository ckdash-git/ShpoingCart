//
//  ProductViewModel.swift
//  MyStoreApp
//
//  Created by Chandan Kumar Dash on 01/04/25.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var errorMessage: String?

    init() {
        fetchProducts()
    }

    func fetchProducts() {
        APIService.shared.fetchProducts { result in
            switch result {
            case .success(let products):
                self.products = products
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
