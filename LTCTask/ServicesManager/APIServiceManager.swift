//
//  APIServiceManager.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import Foundation

enum APIServiceError: LocalizedError {
    case Error(Error)
    case CustomErrorMessage(String)
    //add your own error types
}

final class APIServiceManager: APIServiceManagerProtocol {
    private(set) var urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetch<T: Codable>(requestModel: APIRequestProtocol,
                           expectedType: T.Type) async throws -> T {
        guard let request = prepareRequest(requestModel) else {
            throw APIServiceError.CustomErrorMessage(AppConstants.noRequestFound)
        }
        let (data, response) = try await urlSession.data(for: request)
        guard response.isValidResponse() else {
            throw APIServiceError.CustomErrorMessage(AppConstants.noDataReceived)
        }
        do {
            let response = try JSONDecoder().decode(expectedType, from: data)
            debugPrint("response = \(response)")
            return response
        } catch {
            throw APIServiceError.Error(error)
        }
    }
    
    private func prepareRequest(_ model: APIRequestProtocol) -> URLRequest? {
        guard let apiURL = model.apiURL else {
            assertionFailure(AppConstants.invalidURL)
            return nil
        }
        var request = URLRequest(url: apiURL)
        request.httpMethod = model.httpMethod.rawValue
        request.timeoutInterval = model.timeoutInterval
        
        //set common header fields
        request.addValue("application/json", forHTTPHeaderField:"Accept")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        return request
    }
    
    deinit {
        debugPrint("deinit called >>>> APIServiceManager")
    }
}
