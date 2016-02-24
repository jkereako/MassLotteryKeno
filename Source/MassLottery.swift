//
//  MassLottery.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

enum MassLottery {
  enum KENO {
    case Today
  }

}

extension MassLottery.KENO: Path {
  var path: String {
    switch self {
    case .Today: return "/search/dailygames/todays/15.json"
    }
  }
}