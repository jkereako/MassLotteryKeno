//
//  AppCoordinator.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/18/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import Foundation
import Kringle

final class AppCoordinator:RootCoordinator {
    var rootViewController: UIViewController {
        return tabBarController
    }

    private let tabBarController: UITabBarController
    private let rootCoordinators: [RootCoordinator]

    init() {
        tabBarController = UITabBarController()
        
        let networkClient = NetworkClient()
        let dateFormatter = DateFormatter()
        var viewControllers = [UIViewController]()

        rootCoordinators = [
            DrawingsCoordinator(networkClient: networkClient, dateFormatter: dateFormatter),
            LocationsCoordinator(networkClient: networkClient, dateFormatter: dateFormatter)
        ]
        rootCoordinators.forEach {
            viewControllers.append($0.rootViewController)
        }

        tabBarController.setViewControllers(viewControllers, animated: true)

        styleNavigationBar()
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
        UINavigationBar.appearance().tintColor = UIColor.init(named: "White")
        UINavigationBar.appearance().barTintColor = UIColor.init(named: "Black")
        UINavigationBar.appearance().isTranslucent = false
    }
}
