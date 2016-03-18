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

  var day: Day? {
    didSet {
      guard let aDay = day, let drawing = aDay.drawings.first else {
        return
      }

      let dateFormatter = NSDateFormatter()

      dateFormatter.dateFormat = "M/dd/yyyy"

      self.gameIdentifier.text = String(drawing.identifier)
      self.drawingsDate.text = dateFormatter.stringFromDate(aDay.date)
      self.bonusMultiplier.text = String(drawing.bonusMultiplier)
    }
  }

  private var coordinator: KenoCoordinator!

  override func viewDidLoad() {
    super.viewDidLoad()

    coordinator = KenoCoordinator(controller: self)
  }
}

