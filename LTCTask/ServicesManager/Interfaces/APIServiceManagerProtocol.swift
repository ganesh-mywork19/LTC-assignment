//
//  APIServiceManagerProtocol.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import Foundation

protocol APIServiceManagerProtocol {
    /// A Generic function to make any API call to Server/backend
    /// - Parameters:
    ///   - requestModel: The request structure that you are providing to an API
    ///   - expectedType: The response structure that you are expecting from an API
    func fetch<T: Codable>(requestModel: APIRequestProtocol,
                           expectedType: T.Type) async throws -> T
}
