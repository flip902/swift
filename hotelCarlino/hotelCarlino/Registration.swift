//
//  Registration.swift
//  hotelCarlino
//
//  Created by Phillip Carlino on 2017-11-20.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import Foundation


struct Registration {
    var firstName: String
    var lastName: String
    var email: String
    
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var roomType: RoomType
    var wifi: Bool
}


