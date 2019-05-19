//
//  GameDayContract.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/16/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

/*
 "min": "1790356",
 "max": "1790444",
 "date": "03/17/2016",
 "day": "Thursday",
 "draws": []
 */

import Foundation

struct GameDayContract: Codable {
    let date: String
    let drawings: [DrawingContract]

    enum CodingKeys: String, CodingKey {
        case date
        case drawings = "draws"
    }
}
