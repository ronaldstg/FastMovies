//
//  AppDelegate.swift
//  FastMovies
//
//  Created by Ronald on 04/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeNavigationController = homeStoryboard.instantiateViewController(withIdentifier: "HomeNavigationController")
        window?.rootViewController = homeNavigationController
        window?.makeKeyAndVisible()
        return true
    }
}

