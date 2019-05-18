//
//  GradientView.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//
import UIKit

@IBDesignable final class LinearGradientView: UIView {
    @IBInspectable var topColor: UIColor = .white
    @IBInspectable var bottomColor: UIColor  = .blue

    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        guard let gradientLayer = layer as? CAGradientLayer else {
            return
        }

        //        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
    }
}

