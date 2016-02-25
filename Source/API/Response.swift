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
//
//  func splitHyphenatedString(string: String) -> [Int] {
//    return string.componentsSeparatedByString("-").map { Int($0)! }
//  }
//
//  func asDict(x: AnyObject) -> [String:AnyObject]? {
//    return x as? [String:AnyObject]
//  }

  /*
  let identifier: Int
  let jackpot: String
  let winningNumbers: [Int]
  let bonus: Int
  */
//  func parseDrawings(data: NSData) -> Drawing? {
//    let json = decodeJSON(data: data)!
//
//    //maybeAny >>>= { $0 as? [AnyObject] }
//    let drawings = dictionary(json, key: "draws") >>>= {
//        join($0.map(self.parseDrawing))
//    }
//    print("posts: \(drawings)")
//  }
//
//  private func parseDrawing(drawing: AnyObject) {
//    let buildDrawing = curry {draw_id, jackpot, winning_num, bonus_value in
//      Drawing(
//        identifier: draw_id,
//        jackpot: jackpot,
//        winningNumbers: winning_num,
//        bonus: bonus_value)
//    }
//
//    return (asDict(drawing) >>>= {
//      buildDrawing <*> int($0, key: "draw_id")
//        <*> string($0, key: "jackpot")
//        <*> (string($0, key: "winning_num") >>>= self.splitHyphenatedString )
//        <*> int($0, key: "bonus_value")
//    })!
//  }
}
