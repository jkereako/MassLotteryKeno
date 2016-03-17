//
//  AppDelegate.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder {
  var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
  func application(
    application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?)
    -> Bool {

      AppCoordinator().start()

      return true
  }
}

