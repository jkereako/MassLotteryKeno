//
//  KenoCoordinator.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/17/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

final class KenoCoordinator: NSObject, Coordinator {
  var day: DecodedDay? {
    didSet {
      self.controller.day = day
    }
  }

  private let controller: KenoViewController

  init(controller: KenoViewController) {
    self.controller = controller

    super.init()
  }
}
