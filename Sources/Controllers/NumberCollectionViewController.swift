//
//  WinningNumbersController.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 2/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

final class NumberCollectionViewController: UICollectionViewController, Controller {
    var appCoordinator: AppCoordinator?

    var numbers: [Int]? {
        didSet {
            collectionView?.reloadData()
        }
    }

    private var coordinator: NumberGridCoordinator!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else {
            assertionFailure("Collection view layout is not of type UICollectionViewFlowLayout.")
            return
        }

        coordinator = NumberGridCoordinator(controller: self)
        appCoordinator?.coordinators.append(coordinator)

        switch UIScreen.main.bounds.size {

        // 4s
        case CGSize(width: 320, height: 480):
            layout.itemSize = CGSize(width: 64, height: 64)

        // 5(s) and 6(s) with display zoom
        case CGSize(width: 320, height: 568):
            switch UIScreen.main.scale {
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
        case CGSize(width: 375, height: 667):
            switch UIScreen.main.scale {
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
        case CGSize(width: 414, height: 736):
            layout.itemSize = CGSize(width: 84, height: 84)

        default:
            layout.itemSize = CGSize(width: 64, height: 64)
        }
    }

    override func collectionView(
        _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return numbers?.count ?? 20
    }

//    override func collectionView(
//        collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath)
//        -> UICollectionViewCell {
//
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: "number", for: indexPath as IndexPath
//                ) as? NumberCell else {
//                    assertionFailure("Could not dequeue cell")
//                    return UICollectionViewCell()
//            }
//
//            cell.number.text = ""
//
//            if let nums = numbers {
//                cell.number.text = String(nums[indexPath.row])
//                cell.number.alpha = 0.0
//
//                // Implicitly animate the layer
//                UIView.animate(withDuration: 1.0, animations: { cell.number.alpha = 1.0 })
//            }
//
//
//            return cell
//    }
}
