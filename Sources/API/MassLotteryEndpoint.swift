//
//  MassLotteryEndpoint.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 5/18/19.
//  Copyright © 2019 Alexis Digital. All rights reserved.
//

import Kringle

enum MassLotteryEndpoint {
    case todaysGames
}

extension MassLotteryEndpoint: Endpoint {
    var baseURL: URL { return URL(string: "http://www.masslottery.com/data/json")! }

    var path: String {
        switch self {
        case .todaysGames:
            return "/search/dailygames/todays/15.json"
        }
    }
}
