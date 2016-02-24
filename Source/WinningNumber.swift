//
//  WinningNumber.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class WinningNumber: UICollectionViewCell {
  override func awakeFromNib() {
    super.awakeFromNib()

    // Create a border
    layer.cornerRadius = 15.0
    layer.borderWidth = 3.0
    layer.borderColor = UIColor.whiteColor().CGColor
    layer.masksToBounds = true

    // Create a drop shadow
    layer.shadowColor = UIColor.blackColor().CGColor
    layer.shadowOffset = CGSize(width: 0, height: 2.0)
    layer.shadowRadius = 2.0
    layer.shadowOpacity = 1.0
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(
      roundedRect: bounds, cornerRadius: layer.cornerRadius
      ).CGPath
  }
}
