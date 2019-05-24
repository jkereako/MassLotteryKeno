//
//  DrawingTableViewModel.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/19/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import UIKit

protocol DrawingTableViewModelDataSource: class {
    var cellReuseIdentifier: String { get }

    func configure(_ cell: UITableViewCell, with drawingViewModel: DrawingViewModel) -> UITableViewCell
}

protocol DrawingTableViewModelDelegate: class {
    func didSelect(_ drawingViewModel: DrawingViewModel)
    func refreshData(for viewController: DrawingTableViewController)
}

final class DrawingTableViewModel: NSObject {
    let title: String
    weak var dataSource: DrawingTableViewModelDataSource?
    weak var delegate: DrawingTableViewModelDelegate?

    private let drawingViewModels: [DrawingViewModel]

    init(drawingViewModels: [DrawingViewModel]) {
        title = "Today's Drawings"
        self.drawingViewModels = drawingViewModels.sorted { $0.gameIdentifier > $1.gameIdentifier }
    }
}

// MARK: - UITableViewDataSource
extension DrawingTableViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drawingViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellReuseIdentifier = dataSource?.cellReuseIdentifier else {
            assertionFailure("Expected a value")

            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellReuseIdentifier, for: indexPath
        )

        return dataSource?.configure(cell, with: drawingViewModels[indexPath.row]) ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension DrawingTableViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(drawingViewModels[indexPath.row])
    }
}

// MARK: - Target-actions
extension DrawingTableViewModel: DrawingTableViewControllerDelegate {
    func didPullToRefresh(tableViewController: DrawingTableViewController,
                          refreshControl: UIRefreshControl) {

        // Just a pass-through
        delegate?.refreshData(for: tableViewController)
    }
}
