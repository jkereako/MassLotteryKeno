//
//  GradientView.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//
import UIKit

@IBDesignable class LinearGradient: UIView {
  @IBInspectable  var topColor: UIColor = UIColor.whiteColor() {
    didSet {
      updateView()
    }
  }

  @IBInspectable var bottomColor: UIColor  = UIColor.blackColor() {
    didSet {
      updateView()
    }
  }

  override class func layerClass() -> AnyClass {
    return CAGradientLayer.self
  }

  private func updateView() {
    let gradientLayer = layer as? CAGradientLayer
    gradientLayer?.locations = [0.0, 1.0]
    gradientLayer?.colors = [topColor.CGColor, bottomColor.CGColor]
  }
}
