//
//  WinningNumbersCoordinator.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/17/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

final class NumberGridCoordinator: NSObject, Coordinator {
  var day: Day? {
    didSet {
      self.controller.numbers = splitWinningNumbers(day!.drawings.first?.winningNumbers ?? "")
    }
  }

  private let controller: NumberGridController

  init(controller: NumberGridController) {
    self.controller = controller

    super.init()
  }

  private func splitWinningNumbers(numbers: String) -> [Int] {
    return numbers.characters.split{$0 == "-"}.map{ Int(String($0))! }
  }
}
