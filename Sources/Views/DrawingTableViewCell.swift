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
    
    @IBOutlet private weak var innerContent: UIView!
    @IBOutlet private weak var gameIdentifier: UILabel!
    @IBOutlet private weak var bonusMultiplier: UILabel!
    @IBInspectable private var innerContentBorderColor: UIColor = UIColor.white
    @IBInspectable private var innerContentBorderWidth: CGFloat = 3.0
    @IBInspectable private var innerContentCornerRadius: CGFloat = 15.0

    private let selectedBackgroundColor = UIColor(named: "DarkBlue")
    private let unselectedBackgroundColor = UIColor(named: "MediumBlue")

    override func awakeFromNib() {
        super.awakeFromNib()
        
        gameIdentifier.text = nil
        bonusMultiplier.text = nil
        innerContent.layer.borderColor = innerContentBorderColor.cgColor
        innerContent.layer.borderWidth = innerContentBorderWidth
        innerContent.layer.cornerRadius = innerContentCornerRadius

        selectionStyle = .none

    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if (highlighted) {
            innerContent.backgroundColor = selectedBackgroundColor

            return
        }

        innerContent.backgroundColor = unselectedBackgroundColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        if (selected) {
            innerContent.backgroundColor = selectedBackgroundColor

            return
        }

        innerContent.backgroundColor = unselectedBackgroundColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        #if TARGET_INTERFACE_BUILDER
        innerContent.layer.borderColor = innerContentBorderColor.cgColor
        innerContent.layer.borderWidth = innerContentBorderWidth
        innerContent.layer.cornerRadius = innerContentCornerRadius
        #endif
    }
}
