//
//  NetworkClientType.swift
//  Kringle
//
//  Created by Jeff Kereakoglow on 4/14/19.
//

import Foundation
import Promises

public protocol NetworkClientType {
    func get(_ endpoint: Endpoint) -> Promise<Void>
    func get<T: Decodable>(_ endpoint: Endpoint, decodingResponseTo contract: T.Type) -> Promise<T>

    func put(_ body: Data, to endpoint: Endpoint) -> Promise<Void>
    func put<T: Decodable>(_ body: Data, to endpoint: Endpoint,
                           decodingResponseTo contract: T.Type) -> Promise<T>

    func post(_ body: Data, to endpoint: Endpoint) -> Promise<Void>
    func post<T: Decodable>(_ body: Data, to endpoint: Endpoint,
                            decodingResponseTo contract: T.Type) -> Promise<T>

    func delete(_ endpoint: Endpoint) -> Promise<Void>
    func delete<T: Decodable>(_ endpoint: Endpoint, decodingResponseTo contract: T.Type) -> Promise<T>
}
