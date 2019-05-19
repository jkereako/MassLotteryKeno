//
//  DrawingTableViewController.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/19/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import UIKit

final class DrawingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
}

extension DrawingTableViewController: DrawingTableViewModelDelegate {
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
