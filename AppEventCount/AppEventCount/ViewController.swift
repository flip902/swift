//
//  ViewController.swift
//  AppEventCount
//
//  Created by Phillip Carlino on 2017-10-20.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    @IBOutlet weak var applicationWillResignActiveLabel: UILabel!
    @IBOutlet weak var applicationDidEnterBackgroundLabel: UILabel!
    @IBOutlet weak var applicationWillEnterForegroundLabel: UILabel!
    @IBOutlet weak var applicationDidBecomeActiveLabel: UILabel!
    @IBOutlet weak var applicationWillTerminateLabel: UILabel!
    
    var launchCount = 0
    var resignActiveCount = 0
    var didEnterBackgroundCount = 0
    var foreGroundCount = 0
    var didBecomeActiveCount = 0
    var terminateCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    func updateView() {
        didFinishLaunchingLabel.text = "The app has launched \(launchCount) times"
        applicationWillResignActiveLabel.text = "applicationWillResignActive has been called \(resignActiveCount) times"
        applicationDidEnterBackgroundLabel.text = "applicationDidEnterBackground has been called \(didEnterBackgroundCount) times"
        applicationWillEnterForegroundLabel.text = "applicationWillEnterForeground has been called \(foreGroundCount) times"
        applicationDidBecomeActiveLabel.text = "applicationDidBecomeActive has been called \(didBecomeActiveCount) times"
        applicationWillTerminateLabel.text = "applicationWillTerminate has been called \(terminateCount) times"
    }


}

