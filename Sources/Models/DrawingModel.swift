//
//  DrawingModel.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/18/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import Foundation

struct DrawingModel {
    let id: Int
    let drawDate: Date
    let numbers: [Int]
    let bonus: Int

    init(contract: DrawingContract, dateFormatter: DateFormatter) {
        dateFormatter.dateFormat = "mm/dd/yyyy"

        id = Int(contract.id) ?? 0
        drawDate = dateFormatter.date(from: contract.drawDate) ?? Date()
        numbers = contract.winningNumbers.split(separator: "-").map { Int(String($0)) ?? 0 }
        bonus = Int(contract.bonusMultiplier) ?? 0
    }
}
