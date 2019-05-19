//
//  NumberViewController.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/18/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import UIKit

final class NumberViewController: UIViewController {
    @IBOutlet private weak var gameIdentifier: UILabel!
    @IBOutlet private weak var drawDate: UILabel!
    @IBOutlet private weak var bonusMultiplier: UILabel!
    @IBOutlet private weak var numberCollectionView: UICollectionView!

    var viewModel: NumberViewModel?

    init() {
        super.init(nibName: "NumberView", bundle: Bundle(for: NumberViewController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        numberCollectionView.dataSource = viewModel
        numberCollectionView.delegate = viewModel

        title = viewModel?.title
        gameIdentifier.text = viewModel?.gameIdentifier
        drawDate.text = viewModel?.drawDate
        bonusMultiplier.text = viewModel?.bonusMultiplier

        let nib = UINib(
            nibName: cellReuseIdentifier, bundle: Bundle(for: NumberCollectionViewCell.self)
        )

        numberCollectionView.register(
            nib, forCellWithReuseIdentifier: cellReuseIdentifier
        )
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel?.dataSource = nil
        viewModel = nil
    }
}

// MARK: - NumberViewModelDataSource
extension NumberViewController: NumberViewModelDataSource {
    var cellReuseIdentifier: String {
        return "NumberCollectionViewCell"
    }

    func configure(_ cell: UICollectionViewCell, with number: String) -> UICollectionViewCell {
        guard let numberCollectionViewCell = cell as? NumberCollectionViewCell else {
            return UICollectionViewCell()
        }

        numberCollectionViewCell.number = number

        return numberCollectionViewCell
    }
}
