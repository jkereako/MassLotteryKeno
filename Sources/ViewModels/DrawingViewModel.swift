//
//  DrawingViewModel.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/19/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import Foundation

final class DrawingViewModel {
    let gameIdentifier: String
    let bonus: String

    private let model: DrawingModel

    init(model: DrawingModel) {
        self.model = model
        gameIdentifier = "#\(model.id)"
        bonus = "\(model.bonus)X"
    }
}
