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

        promise.then { [weak self] gameDayContract in
            self?.refreshData(for: drawingTableViewController, with: gameDayContract)
            }.catch { [weak self] _ in
                self?.showNetworkErrorAlert(on: drawingTableViewController)
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

        styleNavigationBar()
    }
}

// MARK: - DrawingTableViewModelDelegate
extension AppCoordinator: DrawingTableViewModelDelegate {
    func refreshData(for viewController: DrawingTableViewController) {
        let promise = networkClient.get(
            MassLotteryEndpoint.todaysGames, decodingResponseTo: GameDayContract.self
        )

        promise.then { [weak self] gameDayContract in
            self?.refreshData(for: viewController, with: gameDayContract)
            }.catch { [weak self] _ in
                self?.showNetworkErrorAlert(on: viewController)
        }
    }

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

// MARK: - Private Helpers
private extension AppCoordinator {
    func styleNavigationBar() {
        // Bar title text color
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Arial Rounded MT Bold", size: 17.0)!
        ]

        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().tintColor = UIColor.init(named: "MediumBlue")
        UINavigationBar.appearance().barTintColor = UIColor.init(named: "DarkBlue")
        UINavigationBar.appearance().isTranslucent = false
    }

    func refreshData(for tableViewController: DrawingTableViewController,
                     with gameDayContract: GameDayContract) {

        var drawingViewModels =  [DrawingViewModel]()
        let aDateFormatter = dateFormatter

        gameDayContract.drawings.forEach { drawingContract in
            let drawingModel = DrawingModel(
                contract: drawingContract, dateFormatter: aDateFormatter
            )

            drawingViewModels.append(
                DrawingViewModel(model: drawingModel, dateFormatter: aDateFormatter)
            )
        }

        let refreshedDrawingTableViewModel = DrawingTableViewModel(
            drawingViewModels: drawingViewModels
        )

        refreshedDrawingTableViewModel.dataSource = tableViewController
        refreshedDrawingTableViewModel.delegate = self
        tableViewController.delegate = refreshedDrawingTableViewModel
        tableViewController.viewModel = refreshedDrawingTableViewModel
    }

    func showNetworkErrorAlert(on viewController: UIViewController) {
        // Displays an alert if the promise is rejected
        let alertController = UIAlertController(
            title: "Network Error",
            message: "We weren't able to load today's winning numbers. Please try again later.",
            preferredStyle: .alert
        )

        alertController.addAction(UIAlertAction(title: "Okay", style: .cancel))

        viewController.present(alertController, animated: true)
    }
}
