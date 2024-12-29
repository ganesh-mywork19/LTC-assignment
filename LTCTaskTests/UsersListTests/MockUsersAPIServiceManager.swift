//
//  MockUsersAPIServiceManager.swift
//  LTCTaskTests
//
//  Created by Ganesh Guturi on 27/12/24.
//

import Foundation
@testable import LTCTask

/*
 MOCK JSON data and Service class to verify valid and inValid cases
 */
let mockUsersValidResponseJSON = """
             {
               "items": [
                 {
                   "login": "kunal-kushwaha",
                   "id": 25254,
                   "avatar_url": "https://avatars.githubusercontent.com/u/25254?v=4",
                 },
                 {
                   "login": "tj",
                   "id": 42698533,
                   "avatar_url": "https://avatars.githubusercontent.com/u/42698533?v=4",
                 },
                 {
                   "login": "jlord",
                   "id": 1305617,
                   "avatar_url": "https://avatars.githubusercontent.com/u/1305617?v=4",
                 }
                ]
             }
             """

let mockUsersInvalidResponseJSON = """
             {
               "items": [
                 {
                   "login": "kunal-kushwaha",
                   "id": 25254,
                   "avatar_url": "https://avatars.githubusercontent.com/u/25254?v=4",
                 },
             }
             """
struct MockUsersAPIServiceManager: APIServiceManagerProtocol {
    var makeItFailable: Bool = false
    
    var data: Data {
        let jsonString = makeItFailable ? mockUsersInvalidResponseJSON : mockUsersValidResponseJSON
        return jsonString.data(using: .utf8)!
    }
    
    func fetch<T: Codable>(requestModel: APIRequestProtocol,
                           expectedType: T.Type) async throws -> T {
        do {
            let response = try JSONDecoder().decode(expectedType, from: data)
            return response
        } catch {
            throw APIServiceError.Error(error)
        }
    }
}

