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

    @IBOutlet private weak var content: UIView!

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

        content.layer.shadowColor = UIColor.darkGray.cgColor
        content.layer.shadowOffset = CGSize(width: -0.5, height: -0.5)
        content.layer.shadowOpacity = 1
        content.layer.shadowRadius = 1
//        content.layer.position = CGPoint(x: 0, y: 0)

//        let size = self.frame.size
//        self.clipsToBounds = true
//        let layer: CALayer = CALayer()
//        layer.backgroundColor = UIColor.lightGrayColor().CGColor
//        layer.position = CGPointMake(size.width / 2, -size.height / 2 + 0.5)
//        layer.bounds = CGRectMake(0, 0, size.width, size.height)
//        layer.shadowColor = UIColor.darkGrayColor().CGColor
//        layer.shadowOffset = CGSizeMake(0.5, 0.5)
//        layer.shadowOpacity = 0.8
//        layer.shadowRadius = 5.0
//        self.shadowLayer = layer
//
//        self.layer.addSublayer(layer)
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
