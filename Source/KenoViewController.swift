//
//  ViewController.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class KenoViewController: UIViewController {
  @IBOutlet weak var gameIdentifier: UILabel!
  @IBOutlet weak var jackpot: UILabel!
  @IBOutlet weak var bonusMultiplier: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    let request = WinningNumbersRequest()

    request.makeRequest(completion: { [unowned self] (success: Bool, game: Keno?) in

      guard success, let g = game, let drawing = g.drawings.first else {
        return
      }

      self.gameIdentifier.text = String(drawing.identifier)
      self.jackpot.text = String(drawing.jackpot)
      self.bonusMultiplier.text = String(drawing.bonusMultiplier)
      }
    )
  }
}

