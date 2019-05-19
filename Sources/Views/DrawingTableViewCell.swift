//
//  DrawingTableViewCell.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/19/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import UIKit

final class DrawingTableViewCell: UITableViewCell {
    var viewModel: DrawingViewModel? {
        didSet {
            gameIdentifier.text = viewModel?.gameIdentifier
            bonusMultiplier.text = viewModel?.bonus
        }
    }
    
    @IBOutlet private weak var gameIdentifier: UILabel!
    @IBOutlet private weak var bonusMultiplier: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        gameIdentifier.text = nil
        bonusMultiplier.text = nil
    }
}
