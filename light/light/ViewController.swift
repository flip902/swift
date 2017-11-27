//
//  ViewController.swift
//  light
//
//  Created by Phillip Carlino on 2017-09-22.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn = true

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn = !lightOn
        updateUI()
    }
    
    func updateUI() {
//        if lightOn {
//            view.backgroundColor = .white
//
//        } else {
//            view.backgroundColor = .black
//
//        }
        view.backgroundColor = lightOn ? .white : .black
    }
}

