//
//  WinningNumbersRequest.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/16/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Swish

public protocol MassLotteryRequest: Request {
  var baseURL: NSURL { get }
}
