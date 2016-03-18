//
//  WinningNumbersRequest.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/16/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Result
import Argo
import Swish

struct WinningNumbersRequest: MassLotteryRequest {
  typealias ResponseObject = Keno
  var baseURL: NSURL { return NSURL(string: "http://www.masslottery.com/data/json")! }

  /// Build the request
  func build() -> NSURLRequest {
    let url = baseURL.URLByAppendingPathComponent(MassLottery.Keno.WinningNumbers.path)

    let request = NSMutableURLRequest(URL: url)

    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.HTTPMethod = RequestMethod.GET.rawValue

    return request
  }

  /// Parse the response
  func parse(j: JSON) -> Result<ResponseObject, NSError> {
    let keno = Keno.decode(j)
    
    return .fromDecoded(keno)
  }

  /// Send the request
  func makeRequest(completion completion: ((success: Bool, game: Keno?) -> Void)?) {
    APIClient().performRequest(self,
      completionHandler: { (response: Result<ResponseObject, NSError>) in

        switch response {
        case let .Success(keno):
          completion?(success: true, game: keno)

        case .Failure(_):
          print("Unable to parse.")

          completion?(success: false, game: nil)
        }
      }
    )
  }
}
