//
//  mainTabBarController.swift
//  cloudCaféPrototype
//
//  Created by Phillip Carlino on 2018-01-07.
//  Copyright © 2018 Phillip Carlino. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), tag: 0)
        let strainsViewController = UINavigationController(rootViewController: StrainViewController())
        strainsViewController.tabBarItem = UITabBarItem(title: "Strains", image: #imageLiteral(resourceName: "buy"), tag: 1)
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        
        
        
        viewControllers = [homeViewController, strainsViewController]
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }

   
  

}
