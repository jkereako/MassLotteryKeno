//
//  AppCoordinator.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/17/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

let didFinishSuccessfully = (NSBundle.mainBundle().bundleIdentifier ?? "") + ".didFinishSuccessfully"
let didNotFinishSuccessfully = (NSBundle.mainBundle().bundleIdentifier ?? "") + ".didNotFinishSuccessfully"

final class AppCoordinator: NSObject {

  func start() {
    let request = WinningNumbersRequest()

    request.makeRequest(completion: { (success: Bool, game: Keno?) in

      assert(NSThread.isMainThread())

      guard success, let aGame = game else {
        NSNotificationCenter.defaultCenter().postNotificationName(
          didNotFinishSuccessfully, object: nil
        )

        return
      }

      NSNotificationCenter.defaultCenter().postNotificationName(
        didFinishSuccessfully, object: aGame
      )
    })
  }
}