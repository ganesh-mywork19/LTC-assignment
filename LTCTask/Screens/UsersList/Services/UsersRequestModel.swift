//
//  UsersRequestModel.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import Foundation

struct UsersRequestModel: APIRequestProtocol {
    
    init() {
        // We can have any requestId which will be used to track the request and response of any API from server (if your server is capable of handling it)
    }
    
    var httpMethod: HttpMethod {
        return .GET
    }
    
    var endpoint: ServiceEndpoint {
        return .usersList
    }
}
