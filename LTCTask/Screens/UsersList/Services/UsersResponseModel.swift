//
//  UsersResponseModel.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import Foundation

struct UsersResponseModel: Codable {
    let items: [Items]
    
    struct Items: Codable {
        let id: Int
        let login: String
        let avatarURL: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case login
            case avatarURL = "avatar_url"
        }
    }
}
