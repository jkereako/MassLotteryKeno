//
//  ViewController.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit


final class KenoViewController: UIViewController, Controller {
  var appCoordinator: AppCoordinator?

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

  override func awakeFromNib() {
    super.awakeFromNib()

    appCoordinator = AppCoordinator()
    appCoordinator?.start()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    coordinator = KenoCoordinator(controller: self)
    appCoordinator?.coordinators.append(coordinator)
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    guard var viewController = segue.destinationViewController as? Controller else {
      return
    }

    viewController.appCoordinator = appCoordinator
  }
}
