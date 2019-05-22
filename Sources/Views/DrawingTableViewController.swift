//
//  DrawingTableViewController.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/19/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import UIKit

protocol DrawingTableViewControllerDelegate: class {
    func didPullToRefresh(tableViewController: DrawingTableViewController, refreshControl: UIRefreshControl)
}

final class DrawingTableViewController: UITableViewController {
    weak var delegate: DrawingTableViewControllerDelegate?
    var viewModel: DrawingTableViewModel? {
        didSet {

            title = viewModel?.title

            tableView?.refreshControl?.endRefreshing()
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

        let nib = UINib(
            nibName: cellReuseIdentifier, bundle: Bundle(for: DrawingTableViewCell.self)
        )

        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(
            viewModel,
            action: #selector(refreshAction),
            for: .valueChanged
        )


        tableView.register(nib, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.backgroundColor = UIColor(named: "DarkBlue")
        tableView.separatorStyle = .none
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

// MARK: - Target-actions
extension DrawingTableViewController {
    @objc func refreshAction(sender: Any) {
        delegate?.didPullToRefresh(
            tableViewController: self, refreshControl: tableView.refreshControl!
        )
    }
}
