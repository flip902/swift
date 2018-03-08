//
//  User.swift
//  InstagramFirebase
//
//  Created by Phillip Carlino on 2018-02-15.
//  Copyright © 2018 Phillip Carlino. All rights reserved.
//

import Foundation

struct User {
    let username: String
    let profileImageUrl: String
    let uid: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
}
