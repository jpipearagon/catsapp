//
//  AppDelegate.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let viewController = CatsModuleConfigurator.view()
        let navigationController = UINavigationController(rootViewController: viewController)
                
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

