//
//  DrawingViewModel.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/19/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import Foundation

struct DrawingViewModel {
    let model: DrawingModel
    let drawDate: String
    let gameIdentifier: String
    let bonus: String

    init(model: DrawingModel, dateFormatter: DateFormatter) {
        self.model = model

        dateFormatter.dateFormat = "m/dd/yyyy"

        drawDate = dateFormatter.string(from: model.drawDate)
        gameIdentifier = "#\(model.id)"

        if model.bonus > 1 {
            bonus = "\(model.bonus)X"
        } else {
            bonus = ""
        }
    }
}
