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
    let gameIdentifier: String
    let bonus: String
    
    init(model: DrawingModel) {
        self.model = model
        gameIdentifier = "#\(model.id)"
        
        if model.bonus > 1 {
            bonus = "\(model.bonus)X"
        } else {
            bonus = ""
        }
    }
}
