//
//  WinningNumbersController.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

final class WinningNumbersController: UICollectionViewController {
  var numbers: [Int]? {
    didSet {
      collectionView?.reloadData()
    }
  }

  private var coordinator: WinningNumbersCoordinator!

  override func viewDidLoad() {
    super.viewDidLoad()

    coordinator = WinningNumbersCoordinator(controller: self)
    
    guard let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else {
      assertionFailure("Collection view layout is not of type UICollectionViewFlowLayout.")
      return
    }

    switch UIScreen.mainScreen().bounds.size {

    // 4s
    case CGSizeMake(320.0, 480.0):
      layout.itemSize = CGSize(width: 64, height: 64)

    // 5(s) and 6(s) with display zoom
    case CGSizeMake(320.0, 568.0):
      switch UIScreen.mainScreen().scale {
      // 5(s)
      case 2:
        layout.itemSize = CGSize(width: 64, height: 64)
      // 6(s) display zoom
      case 3:
        layout.itemSize = CGSize(width: 64, height: 64)
      default:
        assertionFailure("Unexpected value")
        break
      }

    // 6(s), and 6(s) Plus with display zoom
    case CGSizeMake(375.0, 667.0):
      switch UIScreen.mainScreen().scale {
      // 6(s)
      case 2:
        layout.itemSize = CGSize(width: 74, height: 74)
      // 6(s) Plus display zoom
      case 3:
        layout.itemSize = CGSize(width: 64, height: 64)
      default:
        assertionFailure("Unexpected value")
        break
      }

    // 6 Plus and 6s plus
    case CGSizeMake(414.0, 736.0):
      layout.itemSize = CGSize(width: 84, height: 84)

    default:
      layout.itemSize = CGSize(width: 64, height: 64)
    }
  }

  override func collectionView(
    collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    return numbers?.count ?? 20
  }

  override func collectionView(
    collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath)
    -> UICollectionViewCell {

      guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
        "number", forIndexPath: indexPath
        ) as? WinningNumber else {
          assertionFailure("Could not dequeue cell")
          return UICollectionViewCell()
      }

      cell.winningNumber.text = ""

      if let nums = numbers {
        cell.winningNumber.text = String(nums[indexPath.row])
      }

      
      return cell
  }
}
