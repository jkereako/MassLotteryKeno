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
        
        guard let layout = numberCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            assertionFailure("Expected a UICollectionViewFlowLayout")
            return
        }
        
        numberCollectionView.dataSource = viewModel
        numberCollectionView.delegate = viewModel
        
        let adjustedScreenWidth = UIScreen.main.bounds.width - 70
        let width = adjustedScreenWidth / 4
        
        layout.itemSize = CGSize(width: width, height: width * 0.75)
        
        title = viewModel?.title
        gameIdentifier.text = viewModel?.gameIdentifier
        
        bonusMultiplier.text = viewModel?.bonusMultiplier
        
        let nib = UINib(
            nibName: cellReuseIdentifier, bundle: Bundle(for: NumberCollectionViewCell.self)
        )
        
        numberCollectionView.register(
            nib, forCellWithReuseIdentifier: cellReuseIdentifier
        )
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
