//
//  ViewController.swift
//  LoginFirebase
//
//  Created by Phillip Carlino on 2017-12-16.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0.9133029514, alpha: 1)
        UIApplication.shared.statusBarStyle = .lightContent

        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3932834201, green: 0.2493760851, blue: 0.554172092, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9451058209, green: 0.973092481, blue: 0.5301041138, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "Didot-italic", size: 20)!, NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.9451058209, green: 0.973092481, blue: 0.5301041138, alpha: 1) ]
        self.title = "Haligrove"
    }
    
    @objc func handleLogout() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
    

   


}

