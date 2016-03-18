//
//  AppCoordinator.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/17/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

final class AppCoordinator: NSObject {
  var coordinators = [Coordinator]()
  private var day: Day! {
    didSet {

      for var coordinator in coordinators {
        coordinator.day = self.day
      }
    }
  }

  func start() {
    let request = WinningNumbersRequest(
      baseURL: NSURL(string: "http://www.masslottery.com/data/json")!,
      path: MassLottery.Keno.WinningNumbers
    )

    request.makeRequest(completion: { [unowned self] (success: Bool, day: Day?) in

      guard success, let aDay = day else {
        return
      }

      self.day = aDay
      
      })
  }
}
