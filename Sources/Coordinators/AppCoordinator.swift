//
//  AppCoordinator.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/18/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import Foundation
import Kringle

final class AppCoordinator {
    var homeViewController: UIViewController {
        let drawingTableViewController = DrawingTableViewController()
        let promise = networkClient.get(
            MassLotteryEndpoint.todaysGames, decodingResponseTo: GameDayContract.self
        )

        promise.then { [weak self] gameDay in
            var drawingViewModels =  [DrawingViewModel]()
            let aDateFormatter = self?.dateFormatter ?? DateFormatter()

            gameDay.drawings.forEach { drawingContract in
                let drawingModel = DrawingModel(
                    contract: drawingContract, dateFormatter: aDateFormatter
                )

                drawingViewModels.append(
                    DrawingViewModel(model: drawingModel)
                )
            }

            let drawingTableViewModel = DrawingTableViewModel(drawingViewModels: drawingViewModels)

            drawingTableViewModel.dataSource = drawingTableViewController
            drawingTableViewModel.delegate = self
            drawingTableViewController.viewModel = drawingTableViewModel
            
            }.catch { _ in
                // Displays an alert if the promise is rejected
                let alertController = UIAlertController(
                    title: "Network Error",
                    message: "We weren't able to load today's winning numbers. Please try again later.",
                    preferredStyle: .alert
                )
                
                alertController.addAction(UIAlertAction(title: "Okay", style: .cancel))
                
                drawingTableViewController.show(alertController, sender: self)
        }

        navigationController = UINavigationController(
            rootViewController: drawingTableViewController
        )

        return navigationController!
    }
    
    private let networkClient: NetworkClientType
    private let dateFormatter: DateFormatter
    private var navigationController: UINavigationController?

    init(networkClient: NetworkClientType) {
        self.networkClient = networkClient
        dateFormatter = DateFormatter()
    }
}

// MARK: - DrawingTableViewModelDelegate
extension AppCoordinator: DrawingTableViewModelDelegate {
    func didSelect(_ drawingViewModel: DrawingViewModel) {
        let numberViewController = NumberViewController()
        let numberViewModel = NumberViewModel(
            drawing: drawingViewModel.model, dateFormatter: dateFormatter
        )

        numberViewModel.dataSource = numberViewController
        numberViewController.viewModel = numberViewModel
        
        navigationController?.show(numberViewController, sender: self)
    }
}
