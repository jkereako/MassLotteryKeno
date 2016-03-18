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

struct WinningNumbersRequest: Request {
  typealias ResponseObject = Keno

  private let baseURL: NSURL
  private let path: Path

  init(baseURL: NSURL, path: Path) {
    self.baseURL = baseURL
    self.path = path
  }

  /// Build the request
  func build() -> NSURLRequest {
    let url = baseURL.URLByAppendingPathComponent(path.path)

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
