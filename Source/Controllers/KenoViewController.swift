//
//  ViewController.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

final class KenoViewController: UIViewController {
  @IBOutlet weak var gameIdentifier: UILabel!
  @IBOutlet weak var drawingsDate: UILabel!
  @IBOutlet weak var bonusMultiplier: UILabel!

  var game: Keno? {
    didSet {
      guard let aGame = game, let drawing = aGame.drawings.first else {
        return
      }

      let dateFormatter = NSDateFormatter()

      dateFormatter.dateFormat = "M/dd/yyyy"

      self.gameIdentifier.text = String(drawing.identifier)
      self.drawingsDate.text = dateFormatter.stringFromDate(aGame.date)
      self.bonusMultiplier.text = String(drawing.bonusMultiplier)
    }
  }

  private var coordinator: KenoCoordinator!

  override func viewDidLoad() {
    super.viewDidLoad()

    coordinator = KenoCoordinator(controller: self)
  }
}

