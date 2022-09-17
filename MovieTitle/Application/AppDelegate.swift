//
//  AppDelegate.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        AppFlowCoordinator(window: window, appDependencies: AppDependencies())
        return true
    }

}

