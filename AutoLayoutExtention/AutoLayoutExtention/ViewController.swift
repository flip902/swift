//
//  ViewController.swift
//  AutoLayoutExtention
//
//  Created by Phillip Carlino on 2018-02-01.
//  Copyright © 2018 Phillip Carlino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView()
        redView.backgroundColor = .red
        
        view.addSubview(redView)
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

extension UIView {
    func anchor() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
