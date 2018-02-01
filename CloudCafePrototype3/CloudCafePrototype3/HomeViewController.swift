//
//  HomeViewController.swift
//  CloudCafePrototype3
//
//  Created by Phillip Carlino on 2018-01-09.
//  Copyright © 2018 Phillip Carlino. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
       view.addSubview(label)
    }
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 12, width: UIScreen.main.bounds.width, height: 300))
        label.textAlignment = .center
        label.text = "About Us"
        label.font = UIFont(name: "Chalkduster", size: 30)
        return label
    }()

}
