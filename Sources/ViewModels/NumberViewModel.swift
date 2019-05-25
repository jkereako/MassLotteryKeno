//
//  NumberViewModel.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/18/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import UIKit

protocol NumberViewModelDataSource: class {
    var cellReuseIdentifier: String { get }

    func configure(_ cell: UICollectionViewCell, with number: String) -> UICollectionViewCell
}

final class NumberViewModel: NSObject {
    weak var dataSource: NumberViewModelDataSource?

    let title: String
    let gameIdentifier: String
    let drawDate: String
    let bonusMultiplier: String
    let numbers: [String]

    init(drawing: DrawingModel, dateFormatter: DateFormatter) {
        title = "Winning Numbers"
        gameIdentifier = "Game # \(drawing.id)"
        drawDate = dateFormatter.string(from: drawing.drawDate)

        if drawing.bonus > 1 {
            bonusMultiplier = "BONUS = \(drawing.bonus)x"
        } else {
            bonusMultiplier = ""
        }

        numbers = drawing.numbers.map { String($0) }

        dateFormatter.dateFormat = "m/dd/yyyy"
        
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

        guard let cellReuseIdentifier = dataSource?.cellReuseIdentifier else {
            assertionFailure("Expected a value")

            return UICollectionViewCell()
        }

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellReuseIdentifier, for: indexPath
        )

        return dataSource?.configure(cell, with: numbers[indexPath.row]) ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate
extension NumberViewModel: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected #\(numbers[indexPath.row])")
    }
}
