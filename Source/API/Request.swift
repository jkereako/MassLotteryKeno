//
//  Request.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

struct Request {
  static let baseURL = NSURL(string: "http://www.masslottery.com/data/json")!
  func todaysWinningKENONumbers() -> Resource<String> {
    return Resource(
      path: MassLottery.Keno.TodaysWinningNumbers,
      method: Method.GET,
      requestBody: nil,
      headers: [:],
      parser: Response().parseString
    )
  }
}