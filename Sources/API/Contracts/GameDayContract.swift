//
//  GameDayContract.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/16/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

struct GameDayContract: Codable {
    let date: String
    let drawings: [DrawingContract]

    enum CodingKeys: String, CodingKey {
        case date
        case drawings = "draws"
    }
}
