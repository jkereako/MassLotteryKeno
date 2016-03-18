//
//  WinningNumbersCoordinator.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/17/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

final class WinningNumbersCoordinator: NSObject {
  private let controller: WinningNumbersController

  init(controller: WinningNumbersController) {
    self.controller = controller

    super.init()

    NSNotificationCenter.defaultCenter().addObserver(
      self,
      selector: "setNumbers:",
      name: didFinishSuccessfully,
      object: nil
    )
  }

  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }

  func setNumbers(note: NSNotification) {
    guard let object = note.object as? Wrapper<Day> else {
      assertionFailure("Expected a Wrapper<Keno> object")
      return
    }

    controller.numbers =  splitWinningNumbers(object.aStruct.drawings.first?.winningNumbers ?? "")
  }

  private func splitWinningNumbers(numbers: String) -> [Int] {
    return numbers.characters.split{$0 == "-"}.map{ Int(String($0))! }
  }
}
