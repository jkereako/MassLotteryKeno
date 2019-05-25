//
//  LocationsCoordinator.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/24/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import Kringle
import UIKit

final class LocationsCoordinator: RootCoordinator {
    var rootViewController: UIViewController {
        let viewController = UIViewController()

        viewController.title = "Locations"
        viewController.view.backgroundColor = .orange

        navigationController = UINavigationController(
            rootViewController: viewController
        )

        return navigationController!
    }

    private let networkClient: NetworkClient
    private let dateFormatter: DateFormatter
    private var navigationController: UINavigationController?

    init(networkClient: NetworkClient, dateFormatter: DateFormatter) {
        self.networkClient = networkClient
        self.dateFormatter = dateFormatter
    }
}
