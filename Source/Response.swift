//
//  Response.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

struct Response {
  func defaultFailureHandler(failureReason: Reason, data: NSData?) {
    let string = String(data: data!, encoding: NSUTF8StringEncoding)

    print("Failure: \(failureReason) \(string)")
  }

  func parseString(data: NSData) -> String? {
    return String(data: data, encoding: NSUTF8StringEncoding)
  }
}
