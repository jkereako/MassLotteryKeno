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
        let viewController = NumberViewController()
        let dateFormatter = DateFormatter()
        let promise = networkClient.get(
            MassLotteryEndpoint.todaysGames, decodingResponseTo: GameDayContract.self
        )
        
        promise.then { gameDay in
            guard let drawing = gameDay.drawings.first else {
                return
            }
            
            let drawingModel = DrawingModel(contract: drawing, dateFormatter: dateFormatter)
            let numberViewModel = NumberViewModel(
                drawing: drawingModel,
                dateFormatter: dateFormatter
            )
            
            numberViewModel.delegate = viewController
            viewController.viewModel = numberViewModel
            }.catch { _ in
                
                // Displays an alert if the promise is rejected
                let alertController = UIAlertController(
                    title: "Network Error",
                    message: "We weren't able to load today's winning numbers. Please try again later.",
                    preferredStyle: .alert
                )
                
                alertController.addAction(UIAlertAction(title: "Okay", style: .cancel))
                
                viewController.show(alertController, sender: self)
        }
        
        return viewController
    }
    
    private let networkClient: NetworkClientType
    
    init(networkClient: NetworkClientType) {
        self.networkClient = networkClient
    }
}
