//
//  Product.swift
//  MyStoreApp
//
//  Created by Chandan Kumar Dash on 01/04/25.
//

import Foundation

struct Rating: Codable {
    let rate: Double
    let count: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}
