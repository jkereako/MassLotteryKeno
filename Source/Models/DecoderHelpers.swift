//
//  DecoderHelpers.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/17/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Argo

/// Convert a String to an Int
let toInt: String -> Decoded<Int> = {
  .fromOptional(Int($0))
}

/// Strips the first character and converts the String to an Int
let currencyToInt: String -> Decoded<Int> = {
  .fromOptional(Int(String($0.characters.dropFirst())))
}

/// Convert a String to a Date
let toDate: String -> Decoded<NSDate> = {
  .fromOptional(jsonDateFormatter.dateFromString($0))
}

let jsonDateFormatter: NSDateFormatter = {
  let dateFormatter = NSDateFormatter()
  dateFormatter.dateFormat = "MM/dd/yyyy"
  return dateFormatter
}()

// Expression was too complex
/*
let toArrayOfInts: String -> Decoded<[Int]> = {
  $0.characters.split{$0 == "-"}.map{ .fromOptional(Int(String($0))) }
}
*/
