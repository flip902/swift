//
//  MenuItem.swift
//  RestaurantApi
//
//  Created by Phillip Carlino on 2017-12-10.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import Foundation

struct MenuItem: Codable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var imageUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case category
        case imageUrl = "image_url"
    }
}

struct MenuItems: Codable {
    let items: [MenuItem]
}
