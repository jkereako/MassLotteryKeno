//
//  AppCoordinator.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/17/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Alamofire
import Argo

final class AppCoordinator: NSObject {
  var coordinators = [Coordinator]()
  private var day: DecodedDay! {
    didSet {

      for var coordinator in coordinators {
        coordinator.day = self.day
      }
    }
  }

  func start() {
    Alamofire.request(Router.WinningNumbers)
      .validate(contentType: ["text/plain"])
      .responseJSON { response in

        switch response.result {
        case .Success:
          if let json = response.result.value as? JSONDictionary, let j: AnyObject = json,
            let decoded: DecodedDay = decode(j) {

            print(decoded)
          }

        case .Failure(let error):
          print(error)
        }
    }
  }
}
