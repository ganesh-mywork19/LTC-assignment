//
//  UserDirectoryViewModel.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import Observation

@Observable
final class UserDirectoryViewModel {
    private(set) var users = [User]()
    private(set) var showLoader = false
    private(set) var showAlert = false
    @ObservationIgnored private(set) var service: APIServiceManagerProtocol
    @ObservationIgnored private(set) var errorMessage: String = ""

    init(service: APIServiceManagerProtocol) {
        self.service = service
    }
    
    // Method to fetch the Users data from server
    func fetchUsers() async {
        do {
            showLoader = true
            let response = try await self.service.fetch(requestModel: requestModel,
                                                        expectedType: UsersResponseModel.self)
            await prepareUsers(from: response)
            
        } catch {
            await prepareErrorMessage(from: error)
        }
    }
    
    @MainActor
    func prepareUsers(from responseModel: UsersResponseModel) {
        showLoader = false
        users = responseModel.items.map {
            User(
                id: $0.id,
                name: $0.login,
                avatarURL: $0.avatarURL
            )
        }
    }
    
    @MainActor
    func prepareErrorMessage(from error: Error) {
        if let err = error as? APIServiceError {
            switch err {
            case .Error(let newErr):
                errorMessage = newErr.localizedDescription
            case .CustomErrorMessage(let newErrMsg):
                errorMessage = newErrMsg
            }
        } else {
            errorMessage = error.localizedDescription
        }
        showLoader = false
        showAlert = true
    }
    
    // Function to dismiss the alert
    @MainActor
    func dismissAlert() {
        showAlert = false
    }
    
    deinit {
        debugPrint("deinit called >>>> UserDirectoryViewModel")
    }
}

extension UserDirectoryViewModel {
    
    var requestModel: APIRequestProtocol {
        UsersRequestModel()
    }
}
