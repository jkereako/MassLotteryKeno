//
//  Drawing.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Argo
import Curry

/*
"draw_id": "1790381",
"jackpot": "$16",
"winning_num_org": "16-14-04-10-65-49-40-45-79-37-53-02-78-24-52-74-03-06-70-36",
"winning_num": "02-03-04-06-10-14-16-24-36-37-40-45-49-52-53-65-70-74-78-79",
"bonus": "3x",
"bonus_value": "3"
*/

struct Drawing: Decodable {
  let identifier: Int
  let winningNumbers: String
  let bonusMultiplier: Int

  static func decode(j: JSON) -> Decoded<Drawing> {
    // https://github.com/thoughtbot/Argo/issues/272
    
    let f = curry(self.init)
    return f
      <^> (j <| "draw_id" >>- toInt)
      <*> j <| "winning_num_org"
      <*> (j <| "bonus_value" >>- toInt)
  }
}


