//
//  AppDelegate.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit
import Kringle

@UIApplicationMain
final class AppDelegate: UIResponder {
    var window: UIWindow?

    private var appCoordinator: AppCoordinator!
}

// MARK: - UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        appCoordinator = AppCoordinator(networkClient: NetworkClient())

        // The ol' fashioned way.
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = appCoordinator.homeViewController
        window!.makeKeyAndVisible()

        return true
    }
}
