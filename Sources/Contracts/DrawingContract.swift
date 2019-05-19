//
//  DrawingContract.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

/*
 {
   "draw_id": "2129800",
   "draw_date": "05/18/2019",
   "winning_num_org": "32-62-51-20-07-10-75-30-47-36-09-11-44-38-74-72-67-17-41-54",
   "winning_num": "07-09-10-11-17-20-30-32-36-38-41-44-47-51-54-62-67-72-74-75",
   "bonus": "No Bonus",
   "bonus_value": "1"
 }
 */

struct DrawingContract: Codable {
    let id: String
    let drawDate: String
    let winningNumbers: String
    let bonusMultiplier: String

    enum CodingKeys: String, CodingKey {
        case id = "draw_id"
        case drawDate = "draw_date"
        case winningNumbers = "winning_num_org"
        case bonusMultiplier = "bonus_value"
    }
}


