//
//  MainTabBarController.swift
//  CloudCafePrototype3
//
//  Created by Phillip Carlino on 2018-01-09.
//  Copyright © 2018 Phillip Carlino. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home"))
        let productTableViewController = UINavigationController(rootViewController: ProductsTableViewController())
        productTableViewController.tabBarItem = UITabBarItem(title: "Products", image: #imageLiteral(resourceName: "buy"), selectedImage: #imageLiteral(resourceName: "buy"))
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        viewControllers = [homeViewController, productTableViewController]
        
    }



}
