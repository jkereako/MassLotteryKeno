//
//  NetworkError.swift
//  Kringle
//
//  Created by Jeff Kereakoglow on 4/14/19.
//

enum NetworkError: Error {
    case unknown
    case emptyResponse
    case clientError(httpStatusCode: Int)
    case serverError(httpStatusCode: Int)
}
