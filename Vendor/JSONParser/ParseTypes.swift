//
//  ParseTypes.swift
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

import Foundation

// These are generic helpers for converting a dictionary of type `[String: AnyObject]` into a
// another, more specific type. If, for example, want to convert the `[String: AnyObject]`
// dictionary into an array of Ints, you would define a function as follows:
//
//  ```swift
//  func arrayOfInts(input: [String: AnyObject], key: String) ->  [Int]? {
//    let maybeAny: AnyObject? = input[key]
//    return maybeAny >>>= { $0 as? [Int] }
//  }
//  ```

func array(input: [String: AnyObject], key: String) ->  [AnyObject]? {
  let maybeAny: AnyObject? = input[key]
  return maybeAny >>>= { $0 as? [AnyObject] }
}

func dictionary(input: [String: AnyObject], key: String) ->  [String:AnyObject]? {
  return input[key] >>>= { $0 as? [String:AnyObject] }
}

func url(input: [String: AnyObject], key: String) -> NSURL? {
  return input[key] >>>= { $0 as? NSURL }
}

func string(input: [String: AnyObject], key: String) -> String? {
  return input[key] >>>= { $0 as? String }
}

func number(input: [NSObject: AnyObject], key: String) -> NSNumber? {
  return input[key] >>>= { $0 as? NSNumber }
}

func int(input: [NSObject: AnyObject], key: String) -> Int? {
  return number(input, key: key).map { $0.integerValue }
}

func bool(input: [NSObject: AnyObject], key: String) -> Bool? {
  return number(input, key: key).map { $0.boolValue }
}
