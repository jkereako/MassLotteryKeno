//
//  APIRequest.swift
//  TinyNetwork
//
//  Created by Chris Eidof on 11/07/14.
//  Copyright © 2015 Chris Eidhof
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software
//  and associated documentation files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or
//  substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
//  BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

// See the accompanying blog post: http://chris.eidhof.nl/posts/tiny-networking-in-swift.html

import Foundation

struct APIRequest {
  let session: NSURLSession
  let baseURL: NSURL

  init(baseURL: NSURL, session: NSURLSession = NSURLSession.sharedSession()) {
    self.baseURL = baseURL
    self.session = session
  }

  func makeRequest<A>(
    requestModifier requestModifier: (NSMutableURLRequest -> ())?, resource: Resource<A>,
    failure: (Reason, NSData?) -> (), completion: A -> ()) {

      let session = NSURLSession.sharedSession()
      let url = baseURL.URLByAppendingPathComponent(resource.path.path)
      let request = NSMutableURLRequest(URL: url)

      request.HTTPMethod = resource.method.rawValue
      request.HTTPBody = resource.requestBody

      requestModifier?(request)

      for (key,value) in resource.headers {
        request.setValue(value, forHTTPHeaderField: key)
      }

      let task = session.dataTaskWithRequest(request) {
        (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in

        if let httpResponse = response as? NSHTTPURLResponse {

          if 200...299 ~= httpResponse.statusCode {
            if let responseData = data {
              if let result = resource.parser(responseData) {
                completion(result)
              }

              else {
                failure(Reason.CouldNotParseJSON, data)
              }
            }

            else {
              failure(Reason.NoData, data)
            }
          } // httpResponse.statusCode == 200

          else {
            failure(Reason.NoSuccessStatusCode(statusCode: httpResponse.statusCode), data)
          }
        }

        else {
          failure(Reason.Other(error!), data)
        }
      }
      
      task.resume()
  }
}
