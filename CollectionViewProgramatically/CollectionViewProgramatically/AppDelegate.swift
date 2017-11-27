//
//  AppDelegate.swift
//  CollectionViewProgramatically
//
//  Created by Phillip Carlino on 2017-09-17.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = ViewController()
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

