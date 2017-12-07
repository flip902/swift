//
//  ViewController.swift
//  jsonDecodableFromUrl
//
//  Created by Phillip Carlino on 2017-11-30.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import UIKit

struct Course {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            print("Do stuff here")
        }.resume()
        
    }

    


}

