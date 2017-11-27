//
//  ViewController.swift
//  ChangeLabel
//
//  Created by Phillip Carlino on 2017-09-21.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.setTitleColor(.purple, for: .normal)
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
        mainLabel.text = "You Clicked Me!"
        mainLabel.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

