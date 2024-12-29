//
//  UserDirectoryViewModelTests.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import XCTest
@testable import LTCTask

final class UserDirectoryViewModelTests: XCTestCase {
    private var sut: UserDirectoryViewModel! = nil
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func test_Fetch_Users_Success() {
        sut = UserDirectoryViewModel(service: MockUsersAPIServiceManager())
        XCTAssertNotNil(sut.service, "The service should not be nil.")
        let exp = self.expectation(description: "<< Success >> Waiting for network call to finish")
        Task {
            await sut.fetchUsers()
            
            XCTAssertTrue(sut.users.count > 0)
            XCTAssertEqual(sut.requestModel.httpMethod, HttpMethod.GET)
            XCTAssertEqual(sut.requestModel.endpoint, ServiceEndpoint.usersList)
            XCTAssertFalse(sut.showLoader)
            XCTAssertFalse(sut.showAlert)
            XCTAssertEqual(sut.errorMessage, "")
            
            let user = sut.users.first!
            let displayableName = user.name.prefix(1).capitalized + user.name.dropFirst()
            XCTAssertEqual(user.displayableName, displayableName)

            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
    
    func test_Fetch_Users_Failure() {
        var service = MockUsersAPIServiceManager()
        service.makeItFailable = true
        sut = UserDirectoryViewModel(service: service)
        XCTAssertNotNil(sut.service, "The service should not be nil.")
        let exp = self.expectation(description: "<< Failure >> Waiting for network call to finish")
        Task {
            await sut.fetchUsers()
            
            XCTAssertTrue(sut.users.count == 0)
            XCTAssertEqual(sut.requestModel.httpMethod, HttpMethod.GET)
            XCTAssertEqual(sut.requestModel.endpoint, ServiceEndpoint.usersList)
            XCTAssertFalse(sut.showLoader)
            XCTAssertTrue(sut.errorMessage.count > 0)
            XCTAssertTrue(sut.showAlert)

            await sut.dismissAlert()
            XCTAssertFalse(sut.showAlert)

            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
    
//    func test_UsersValidResponse() {
//        let data = mockUsersValidResponseJSON.data(using: .utf8)!
//        let response = try? JSONDecoder().decode(UsersResponseModel.self, from: data)
//        XCTAssertNotNil(response, "The response should not be nil.")
//        XCTAssertTrue(response!.items.count > 0)
//    }
}
