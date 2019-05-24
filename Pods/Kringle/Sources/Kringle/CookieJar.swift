//
//  CookieJar.swift
//  Kringle
//
//  Created by Jeff Kereakoglow on 4/14/19.
//  Copyright © 2019 AlexisDigital. All rights reserved.
//

import Foundation

final public class CookieJar {
    private let endpoint: Endpoint
    private let rfc1123DateFormatter: DateFormatter
    private let calendar: Calendar
    private let today: Date
    
    public var domain: String {
        let host = endpoint.baseURL.host!
        let components = host.components(separatedBy: ".")
        
        var domainComponents = components
        
        if components.count >= 2 {
            domainComponents = Array(components.dropFirst(components.count - 2))
        }
        
        return ".\(domainComponents.joined(separator: "."))"
    }
    
    public init(endpoint: Endpoint) {
        self.endpoint = endpoint
        today = Date()
        rfc1123DateFormatter = DateFormatter()
        calendar = Calendar.current
        
        rfc1123DateFormatter.dateFormat = "EEE',' dd MMM yyyy HH':'mm':'ss z"
        rfc1123DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        rfc1123DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    }
    
    public func setCookies(with httpURLResponse: HTTPURLResponse) {
        guard let headerFields = httpURLResponse.allHeaderFields as? [String: String] else {
            return
        }
        
        let cookies = HTTPCookie.cookies(
            withResponseHeaderFields: headerFields, for: endpoint.baseURL
        )
        
        if cookies.count < 1 {
            if let badCookies = expiredCookies(forHTTPHeaderFields: headerFields) {
                badCookies.forEach { _ = deleteCookie($0) }
            }
            
            return
        }
        
        HTTPCookieStorage.shared.setCookies(cookies, for: endpoint.baseURL, mainDocumentURL: nil)
    }
    
    public func setCookie(_ value: String, forName name: String) {
        let cookieProperties: [HTTPCookiePropertyKey : Any]
        
        cookieProperties = [.name: name,
                            .value: value,
                            .path: "/",
                            .domain: domain]
        
        let cookie = HTTPCookie(properties: cookieProperties)!
        
        HTTPCookieStorage.shared.setCookie(cookie)
    }
    
    public func cookie(forName name: String) -> String? {
        guard let cookies = HTTPCookieStorage.shared.cookies(for: endpoint.baseURL) else {
            return nil
        }
        
        let cookie = cookies.first { $0.name == name }
        
        return cookie?.value ?? nil
    }
    
    public func deleteCookie(_ name: String) -> Bool {
        guard let cookies = HTTPCookieStorage.shared.cookies(for: endpoint.baseURL) else {
            return false
        }
        
        guard let cookie = cookies.first(where: { $0.name == name }) else {
            return false
        }
        
        HTTPCookieStorage.shared.deleteCookie(cookie)
        
        return true
    }
    
    public func clearCookies() {
        HTTPCookieStorage.shared.cookies(for: endpoint.baseURL)?.forEach {
            HTTPCookieStorage.shared.deleteCookie($0)
        }
    }
}

// MARK: - Private Helpers
private extension CookieJar {
    func expiredCookies(forHTTPHeaderFields headerFields: [String: String]) -> [String]? {
        guard headerFields.count > 0 else {
            return nil
        }
        
        // Since we're doing string matching, be damn sure the cookie's string is formatted
        // correctly
        let normalized = { (str: String) in
            return str.trimmingCharacters(in: .whitespaces).lowercased()
        }
        
        var expiredCookies = [String]()
        
        for headerField in headerFields {
            if normalized(headerField.key) == "set-cookie" {
                let headerFieldValues = headerField.value.split(separator: ";")
                
                if headerFieldValues.count < 1 {
                    return nil
                }
                
                let values = headerFieldValues.map { String($0) }
                let cookieName = values.first ?? ""
                
                for value in values {
                    if normalized(value).contains("expires") {
                        let expiration = String(value.split(separator: "=").last ?? "")
                        
                        guard let expirationDate = rfc1123DateFormatter.date(from: expiration) else {
                            continue
                        }
                        
                        if today.compare(expirationDate) == .orderedDescending {
                            expiredCookies.append(cookieName)
                        }
                    }
                }
            }
        }
        
        return expiredCookies.count == 0 ? nil : expiredCookies
    }
}
