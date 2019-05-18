//
//  Router.swift
//  MassLotteryKeno
//
//  Created by Jeff Kereakoglow on 3/31/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

enum Router {
    static let baseURLString = "http://www.masslottery.com/data/json"

    case WinningNumbers
//
//    // MARK: - URLRequestConvertible
//    var URLRequest: URLRequest {
//        let result: String = {
//            switch self {
//            case .WinningNumbers:
//                return ("/search/dailygames/todays/15.json")
//            }
//        }()
//
//        let url = URL(string: Router.baseURLString)!
//        return URLRequest(URL: url.URLByAppendingPathComponent(result))
//    }
}
