//
//  DrawingTableViewController.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/19/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import UIKit

final class DrawingTableViewController: UITableViewController {
    var viewModel: DrawingTableViewModel? {
        didSet {
            tableView.dataSource = viewModel
            tableView.delegate = viewModel
            tableView.reloadData()
        }
    }

    init() {
        super.init(style: .grouped)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Today's Drawings"

        let nib = UINib(
            nibName: cellReuseIdentifier, bundle: Bundle(for: DrawingTableViewCell.self)
        )

        tableView.register(nib, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.backgroundColor = UIColor(named: "DarkBlue")
        tableView.separatorStyle = .none
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
    }
}

// MARK: - DrawingTableViewModelDataSource
extension DrawingTableViewController: DrawingTableViewModelDataSource {
    var cellReuseIdentifier: String {
        return "DrawingTableViewCell"
    }

    func configure(_ cell: UITableViewCell, with drawingViewModel: DrawingViewModel) -> UITableViewCell {
        guard let drawingTableViewCell = cell as? DrawingTableViewCell else {
            assertionFailure("Expected a DrawingTableViewCell")

            return UITableViewCell()
        }

        drawingTableViewCell.viewModel = drawingViewModel

        return drawingTableViewCell
    }
}
