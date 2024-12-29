//
//  APIRequestProtocol.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import Foundation

enum HttpMethod: String {
    case POST = "POST"
    case GET = "GET"
}

enum ServiceEndpoint: String {
    case usersList = "/search/users?q=location:London"
    case none
}

protocol APIRequestProtocol {
    var httpMethod: HttpMethod { get }
    var endpoint: ServiceEndpoint { get }
    var apiURL: URL? { get } //final server URL
    var baseUrlString: String { get }
    var timeoutInterval: TimeInterval { get }
    
//    var body: Data? { get } //Should be used for POST httpMethod
//    var additionalHeaderFields: [String: String]? { get } //Can be used when addtional HeaderFields to be set
}

extension APIRequestProtocol {
    var httpMethod: HttpMethod {
        return .POST //Default
    }
    var apiURL: URL? {
        let baseUrl = baseUrlString + endpoint.rawValue
        return URL(string: baseUrl)
    }
    var baseUrlString: String {
        return "https://api.github.com"
    }
    var timeoutInterval: TimeInterval {
        return 30 //Default
    }
}
