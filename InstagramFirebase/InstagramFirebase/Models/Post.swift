//
//  Post.swift
//  InstagramFirebase
//
//  Created by Phillip Carlino on 2018-02-05.
//  Copyright © 2018 Phillip Carlino. All rights reserved.
//

import Foundation


struct Post {
    let user: User
    let imageUrl: String
    let caption: String
    
    init(user: User, dictionary: [String: Any]) {
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
        self.user = user
        self.caption = dictionary["caption"] as? String ?? ""
    }
}
