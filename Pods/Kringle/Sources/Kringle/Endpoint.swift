//
//  Endpoint.swift
//  Kringle
//
//  Created by Jeff Kereakoglow on 4/14/19.
//

import Foundation

public protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
}
