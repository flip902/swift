//
//  AppDelegate.swift
//  AppEventCount
//
//  Created by Phillip Carlino on 2017-10-20.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var viewController: ViewController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        viewController = window?.rootViewController as? ViewController
        
        viewController?.launchCount += 1
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        viewController?.resignActiveCount += 1
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        viewController?.didEnterBackgroundCount += 1
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        viewController?.foreGroundCount += 1
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        viewController?.didBecomeActiveCount += 1
        viewController?.updateView()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        viewController?.terminateCount += 1
    }


}

