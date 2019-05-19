//
//  GameDayModel.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/18/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import Foundation

struct GameDayModel {
    let date: Date
    private(set) var drawings: [DrawingModel]

    init(contract: GameDayContract, dateFormatter: DateFormatter) {
        dateFormatter.dateFormat = "mm/dd/yyyy"

        date = dateFormatter.date(from: contract.date) ?? Date()
        drawings = [DrawingModel]()

        contract.drawings.forEach {
            drawings.append(DrawingModel(contract: $0, dateFormatter: dateFormatter))
        }
    }
}
