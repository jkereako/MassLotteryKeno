//
//  DrawingContract.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

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
