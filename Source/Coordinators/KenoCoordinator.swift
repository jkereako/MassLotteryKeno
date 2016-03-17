//
//  KenoCoordinator.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/17/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

final class KenoCoordinator: NSObject {
  let controller: KenoViewController

  init(controller: KenoViewController) {
    self.controller = controller

    super.init()

    NSNotificationCenter.defaultCenter().addObserver(
      self,
      selector: "setGame:",
      name: didFinishSuccessfully,
      object: nil
    )
  }

  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }

  func setGame(note: NSNotification) {
    guard let object = note.object as? Wrapper<Keno> else {
      assertionFailure("Expected a Wrapper<Keno> object")
      return
    }

    controller.game = object.aStruct
  }
}
