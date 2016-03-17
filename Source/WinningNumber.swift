//
//  WinningNumber.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

@IBDesignable
class WinningNumber: UICollectionViewCell {

  @IBInspectable var borderColor: UIColor = UIColor.whiteColor()
  @IBInspectable var borderWidth: CGFloat = 3.0
  @IBInspectable var cornerRadius: CGFloat = 15.0
  @IBInspectable var shadowColor: UIColor = UIColor.blackColor()
  @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 2.0)
  @IBInspectable var shadowRadius: CGFloat = 2.0
  @IBInspectable var shadowOpacity: Float = 1.0

  override func drawRect(rect: CGRect) {
    // Create a border
    layer.cornerRadius = cornerRadius
    layer.borderWidth = borderWidth
    layer.borderColor = borderColor.CGColor

    // Create a drop shadow
    layer.shadowColor = shadowColor.CGColor
    layer.shadowOffset = shadowOffset
    layer.shadowRadius = shadowRadius
    layer.shadowOpacity = shadowOpacity
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).CGPath

    layer.masksToBounds = true

  }
}
