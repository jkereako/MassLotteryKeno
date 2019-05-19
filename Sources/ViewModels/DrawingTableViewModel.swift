//
//  DrawingTableViewModel.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/19/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import UIKit

protocol DrawingTableViewModelDelegate: class {
    var cellReuseIdentifier: String { get }
    
    func configure(_ cell: UITableViewCell, with drawingViewModel: DrawingViewModel) -> UITableViewCell
}

final class DrawingTableViewModel: NSObject {
    weak var delegate: DrawingTableViewModelDelegate?

    private let drawingViewModels: [DrawingViewModel]

    init(drawingViewModels: [DrawingViewModel]) {
        self.drawingViewModels = drawingViewModels
    }
}

extension DrawingTableViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drawingViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellReuseIdentifier = delegate?.cellReuseIdentifier else {
            assertionFailure("Expected a value")

            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellReuseIdentifier, for: indexPath
        )

        return delegate?.configure(cell, with: drawingViewModels[indexPath.row]) ?? UITableViewCell()
    }
}
