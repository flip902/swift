//
//  HomeViewController.swift
//  cloudCaféPrototype
//
//  Created by Phillip Carlino on 2018-01-07.
//  Copyright © 2018 Phillip Carlino. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       title = "Home"
       view.backgroundColor = #colorLiteral(red: 0.6381112013, green: 0.5214808954, blue: 0.7089348033, alpha: 1)
        print("Home tab Loaded")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
