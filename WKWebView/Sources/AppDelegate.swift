//
//  AppDelegate.swift
//  WKWebView
//
//  Created by 林　翼 on 2017/10/11.
//  Copyright © 2017年 Tsubasa Hayashi. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var backgroundTaskID : UIBackgroundTaskIdentifier = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        self.backgroundTaskID = application.beginBackgroundTask() { [weak self] in
            application.endBackgroundTask((self?.backgroundTaskID)!)
            self?.backgroundTaskID = UIBackgroundTaskInvalid
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        application.endBackgroundTask(self.backgroundTaskID)
    }
}

