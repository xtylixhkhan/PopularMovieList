//
//  AppDelegate.swift
//  Task
//
//  Created by Muhammad Junaid on 14/09/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LandingViewController") as! LandingViewController
        let vc = MoviesViewController(nibName: "MoviesViewController", bundle: .main)
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.isNavigationBarHidden = false
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
        
        return true
    }
}

