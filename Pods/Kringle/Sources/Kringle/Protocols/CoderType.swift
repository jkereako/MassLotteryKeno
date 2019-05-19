//
//  CoderType.swift
//  Kringle
//
//  Created by Jeff Kereakoglow on 4/14/19.
//

import Foundation
import Promises

protocol CoderType {
    /// Asynchronously encodes a contract to JSON data.
    ///
    /// - Parameter contract:
    /// - Returns: a Data instance of encoded JSON
    func encode<T: Encodable>(_ contract: T) -> Promise<Data>

    /// Asynchronously decodes JSON data into a contract
    ///
    /// - Parameters:
    ///   - data: The JSON data to decode
    ///   - to: The contract type to decode to
    /// - Returns: A contract
    func decode<T: Decodable>(_ data: Data, to: T.Type) -> Promise<T>
}
