//
//  Keno.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/16/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Argo
import Curry

/*
"min": "1790356",
"max": "1790444",
"date": "03/17/2016",
"day": "Thursday",
"draws": []
*/

struct Keno: Decodable {
  let date: NSDate
  let drawings: [Drawing]

  static func decode(j: JSON) -> Decoded<Keno> {
    // https://github.com/thoughtbot/Argo/issues/272
    let f = curry(self.init)

    return f
      <^> (j <| "date" >>- toDate)
      <*> j <|| "draws"
  }
}
