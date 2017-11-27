//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Phillip Carlino on 2017-10-21.
//

import Foundation

struct Athlete {
    var name: String
    var age: String
    var league: String
    var team: String
    
    var description: String {
        return "\(name) is \(age) and plays for the \(team) in the \(league)"
    }
}
