//
//  ClassWrapper.swift
//  MassStateKeno
//
//  Created by Jeff Kereakoglow on 3/17/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

/// Intended to wrap a struct in a class for use with NSNotification
class Wrapper<T> {
  var aStruct: T

  init(aStruct: T) {
    self.aStruct = aStruct
  }
}