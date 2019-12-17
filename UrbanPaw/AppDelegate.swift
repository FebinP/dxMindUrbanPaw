//
//  AppDelegate.swift
//  UrbanPaw
//
//  Created by Mac User on 13/12/19.
//  Copyright © 2019 Mac User. All rights reserved.
//

import UIKit
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared().isEnabled = true

        return true
    }
    
    func moveToHome()
       {
           
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           self.navigationController = storyboard.instantiateViewController(withIdentifier: "NavigationController") as? UINavigationController
           let rootVC = storyboard.instantiateViewController(withIdentifier: "YourorderVC") as? YourorderVC
           navigationController = UINavigationController(rootViewController: rootVC!)
           window?.rootViewController =   self.navigationController
           window?.makeKeyAndVisible()

           if window != nil {
               UIView.transition(with: window!, duration: 0.3, options: .transitionCrossDissolve, animations: nil)
           }
       }
       func moveToLogin()
       {
           
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           self.navigationController = storyboard.instantiateViewController(withIdentifier: "NavigationController") as? UINavigationController
           let rootVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
           navigationController = UINavigationController(rootViewController: rootVC!)
           window?.rootViewController =   self.navigationController
           window?.makeKeyAndVisible()
           if window != nil {
               UIView.transition(with: window!, duration: 0.3, options: .transitionCrossDissolve, animations: nil)
           }
       }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

