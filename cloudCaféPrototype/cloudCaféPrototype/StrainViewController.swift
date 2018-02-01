//
//  StrainViewController.swift
//  cloudCaféPrototype
//
//  Created by Phillip Carlino on 2018-01-07.
//  Copyright © 2018 Phillip Carlino. All rights reserved.
//

import UIKit

class StrainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8706160169, green: 0.6024060964, blue: 0.9702966371, alpha: 1)
        title = "Strains"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.font: UIFont(name: "Chalkduster", size: 27)!,
             NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.4355272688, green: 0.9037119289, blue: 0.4894773257, alpha: 1)]
        
        
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
