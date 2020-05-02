//
//  AppDelegate.swift
//  GameOfLifeKata
//
//  Created by mugx on 02/05/2020.
//  Copyright © 2020 mugx. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }
}
