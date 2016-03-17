//
//  WinningNumbersRequest.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/16/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Swish

public protocol KenoRequest: Request {
  var baseURL: NSURL { get }
  func baseRequest(url url: NSURL, method: RequestMethod) -> NSURLRequest
//  func makeRequest(completion completion: ((success: Bool) -> Void)?)
}
