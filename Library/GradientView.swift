//
//  GradientView.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

@IBDesignable public class GradientView: UIView {
  @IBInspectable public var topColor: UIColor? {
    didSet {
      configureView()
    }
  }

  @IBInspectable public var bottomColor: UIColor? {
    didSet {
      configureView()
    }
  }

  override public class func layerClass() -> AnyClass {
    return CAGradientLayer.self
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureView()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    configureView()
  }

  public override func tintColorDidChange() {
    super.tintColorDidChange()
    configureView()
  }

  func configureView() {
    let aLayer = layer as? CAGradientLayer
    let locations = [0.0, 1.0]
    aLayer?.locations = locations
    let color1 = topColor ?? self.tintColor as UIColor
    let color2 = bottomColor ?? UIColor.blackColor() as UIColor
    let colors: Array <AnyObject> = [color1.CGColor, color2.CGColor]
    aLayer?.colors = colors
  }
}
