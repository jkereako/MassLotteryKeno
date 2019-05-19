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

    private let collectionViewCellType: UICollectionViewCell.Type
    private let aCellReuseIdentifier: String

    var viewModel: NumberViewModel! {
        didSet {
            gameIdentifier.text = viewModel.gameIdentifier
            drawDate.text = viewModel.drawDate
            bonusMultiplier.text = viewModel.drawDate

            numberCollectionView.dataSource = viewModel
            numberCollectionView.delegate = viewModel
            numberCollectionView.reloadData()
        }
    }

    init() {
        collectionViewCellType = NumberCollectionViewCell.self
        aCellReuseIdentifier = String(describing: collectionViewCellType)

        super.init(nibName: "NumberView", bundle: Bundle(for: NumberViewController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        collectionViewCellType = NumberCollectionViewCell.self
        aCellReuseIdentifier = String(describing: collectionViewCellType)

        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        let nib = UINib(
            nibName: cellReuseIdentifier, bundle: Bundle(for: collectionViewCellType)
        )

        numberCollectionView.register(
            nib, forCellWithReuseIdentifier: cellReuseIdentifier
        )
    }
}

// MARK: - NumberViewModelDelegate
extension NumberViewController: NumberViewModelDelegate {
    var cellReuseIdentifier: String {
        return aCellReuseIdentifier
    }

    func configure(_ cell: UICollectionViewCell, with number: String) -> UICollectionViewCell {
        guard let numberCollectionViewCell = cell as? NumberCollectionViewCell else {
            return UICollectionViewCell()
        }

        numberCollectionViewCell.number = number

        return numberCollectionViewCell
    }
}
