//
//  Router.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 3/31/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation


import Alamofire

// https://github.com/Alamofire/Alamofire#api-parameter-abstraction
enum Router: URLRequestConvertible {
  static let baseURLString = "http://www.masslottery.com/data/json"

  case WinningNumbers

  // MARK: - URLRequestConvertible
  var URLRequest: NSMutableURLRequest {
    let result: String = {
      switch self {
      case .WinningNumbers:
        return ("/search/dailygames/todays/15.json")
      }
    }()

    let url = NSURL(string: Router.baseURLString)!
    let urlRequest = NSURLRequest(URL: url.URLByAppendingPathComponent(result))
    let encoding = Alamofire.ParameterEncoding.URL

    return encoding.encode(urlRequest, parameters: nil).0
  }
}
