//
//  AppDelegate.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 05.04.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let navigationController: UINavigationController = .init()

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        appCoordinator = AppCoordinator.init(navigationController)
        appCoordinator?.start()
                
        return true
    }

}

