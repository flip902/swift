//
//  ViewController.swift
//  LoginFirebase
//
//  Created by Phillip Carlino on 2017-12-16.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0.9133029514, alpha: 1)
        
        setupNavigationBar()
        checkIfUserLoggedIn()
        setupHomepageLabel()
    }
    
    let homepageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Didot-Bold", size: 24)
        label.textColor = #colorLiteral(red: 0.3932834201, green: 0.2493760851, blue: 0.554172092, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cloud Café Home View"
        return label
    }()
    
    func setupHomepageLabel() {
        view.addSubview(homepageLabel)
        homepageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homepageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        homepageLabel.widthAnchor.constraint(equalTo: view.widthAnchor)
        homepageLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    
    func checkIfUserLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    // Show Username in title
                    self.navigationItem.title = dictionary["name"] as? String
                }
                
            })
        }
    }
    
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3932834201, green: 0.2493760851, blue: 0.554172092, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9451058209, green: 0.973092481, blue: 0.5301041138, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "Didot-italic", size: 20)!, NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.9451058209, green: 0.973092481, blue: 0.5301041138, alpha: 1) ]
        self.title = "Cloud Café"
    }
    
    @objc func handleLogout() {
        
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
}

