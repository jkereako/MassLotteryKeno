//
//  NumberCollectionViewCell.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/18/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import UIKit

@IBDesignable final class NumberCollectionViewCell: UICollectionViewCell {
    var number: String? {
        didSet {
            numberLabel.text = number
        }
    }

    @IBInspectable private var borderColor: UIColor = UIColor.white
    @IBInspectable private var borderWidth: CGFloat = 3.0
    @IBInspectable private var cornerRadius: CGFloat = 15.0
    @IBOutlet private weak var numberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        numberLabel.text = nil

        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        #if TARGET_INTERFACE_BUILDER
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        #endif
    }
}
