//
//  ProductsItem.swift
//  Testovoe Zadanie
//
//  Created by Serper Kurmanbek on 05.06.2024.
//

import UIKit

struct Product: Codable {
    let title: String
    let price: String
    let image: String
//    let added: Bool
    
    init(title: String, price: String, image: String) {
        self.title = title
        self.price = price
        self.image = image
        
    }
}
