//
//  NumberViewController.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/18/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import UIKit

final class NumberViewController: UIViewController {
    @IBOutlet private weak var numberCollectionView: UICollectionView!

    init() {
        super.init(nibName: "NumberView", bundle: Bundle(for: NumberViewController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let type = NumberCollectionViewCell.self
        let reuseIdentifier = String(describing: type)
        let nib = UINib(
            nibName: reuseIdentifier, bundle: Bundle(for: type)
        )

        numberCollectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
