//
//  FirebaseUtils.swift
//  InstagramFirebase
//
//  Created by Phillip Carlino on 2018-02-19.
//  Copyright © 2018 Phillip Carlino. All rights reserved.
//

import Foundation
import Firebase

extension Database {
    static func fetchUserWithUid(uid: String, completion: @escaping (User) -> ()) {
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let userDictionary = snapshot.value as? [String: Any] else { return }
            
            let user = User(uid: uid, dictionary: userDictionary)
            print(user.username)
            completion(user)
            
            
        }) { (err) in
            print("Failed to fetch user for posts:", err)
        }
    }
}


