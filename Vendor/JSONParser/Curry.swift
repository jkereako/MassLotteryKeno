//
//  Curry.swift
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

// The number of arguments per `curry` definition depend on the number of JSON properties you want
// to parse. In it's current state, you may only parse up to 4 properties.

// Take a look at Thoughtbot's Curry (https://github.com/thoughtbot/Curry/blob/master/Source/Curry.swift)
// which supports up to 18 properties.

import Foundation

func curry<A, B, R>(f: (A, B) -> R) -> A -> B -> R {
  return { a in { b in f(a, b) } }
}

func curry<A, B, C, R>(f: (A, B, C) -> R) -> A -> B -> C -> R {
  return { a in { b in {c in f(a, b, c) } } }
}

func curry<A, B, C, D, R>(f: (A, B, C, D) -> R) -> A -> B -> C -> D -> R {
  return { a in { b in { c in { d in f(a, b, c, d) } } } }
}
