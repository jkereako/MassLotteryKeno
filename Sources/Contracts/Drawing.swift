//
//  Drawing.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

/*
 "draw_id": "1790381",
 "jackpot": "$16",
 "winning_num_org": "16-14-04-10-65-49-40-45-79-37-53-02-78-24-52-74-03-06-70-36",
 "winning_num": "02-03-04-06-10-14-16-24-36-37-40-45-49-52-53-65-70-74-78-79",
 "bonus": "3x",
 "bonus_value": "3"
 */

struct Drawing: Codable {
    let id: Int
    let winningNumbers: String
    let bonusMultiplier: Int

    enum CodingKeys: String, CodingKey {
        case id = "draw_id"
        case winningNumbers = "winning_num_org"
        case bonusMultiplier = "bonus_value"
    }
}


