//
//  CookieJarType.swift
//  Kringle
//
//  Created by Jeff Kereakoglow on 4/16/19.
//  Copyright © 2019 AlexisDigital. All rights reserved.
//

import Foundation

public protocol CookieJarType {
    var domain: String { get }
    
    func setCookies(with httpURLResponse: HTTPURLResponse)
    func setCookie(_ value: String, forName name: String)
    func cookie(forName name: String) -> String?
    func deleteCookie(_ name: String) -> Bool
    func clearCookies()
}
