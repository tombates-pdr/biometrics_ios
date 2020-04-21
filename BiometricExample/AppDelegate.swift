//
//  AppDelegate.swift
//  BiometricExample
//
//  Created by Tom Bates on 21/04/2020.
//  Copyright © 2020 Push Doctor. All rights reserved.
//

import UIKit
import Branch

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions
    launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    Branch.setUseTestBranchKey(true)
    Branch.getInstance().initSession(launchOptions: launchOptions)
    return true
  }

}

