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
        let promise = networkClient.get(
            MassLotteryEndpoint.todaysGames, decodingResponseTo: GameDayContract.self
        )
        
        let viewController = NumberViewController()
        
        let dateFormatter = DateFormatter()
        
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
            }.catch { error in
                print("Oh no!")
        }
        
        return viewController
    }
    
    private let networkClient: NetworkClientType
    
    init(networkClient: NetworkClientType) {
        self.networkClient = networkClient
    }
}
