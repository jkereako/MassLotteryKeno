//
//  NumberViewModel.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/18/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import Foundation
import Kringle

protocol NumberViewModelDelegate: class {
    var cellReuseIdentifier: String { get }

    func configure(_ cell: UICollectionViewCell, with number: String) -> UICollectionViewCell
}

final class NumberViewModel: NSObject {
    weak var delegate: NumberViewModelDelegate?

    let gameIdentifier: String
    let drawDate: String
    let bonusMultiplier: String
    let numbers: [String]

    init(drawing: DrawingModel, dateFormatter: DateFormatter) {
        dateFormatter.dateFormat = "m/dd/yyyy"

        gameIdentifier = "Game #\(drawing.id)"
        drawDate = dateFormatter.string(from: drawing.drawDate)

        if drawing.bonus > 1 {
            bonusMultiplier = "BONUS = \(drawing.bonus)X"
        } else {
            bonusMultiplier = ""
        }

        numbers = drawing.numbers.map { String($0) }

        super.init()
    }
}

// MARK: - UICollectionViewDataSource
extension NumberViewModel: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        return numbers.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cellReuseIdentifier = delegate?.cellReuseIdentifier else {
            assertionFailure("Expected a value")

            return UICollectionViewCell()
        }

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellReuseIdentifier, for: indexPath
        )

        return delegate?.configure(cell, with: numbers[indexPath.row]) ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate
extension NumberViewModel: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item selected")
    }
}
