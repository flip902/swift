//
//  IntermediaryModels.swift
//  RestaurantApi
//
//  Created by Phillip Carlino on 2017-12-10.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreperationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
