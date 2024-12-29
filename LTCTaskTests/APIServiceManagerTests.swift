//
//  APIServiceManagerTests.swift
//  LTCTaskTests
//
//  Created by Ganesh Guturi on 26/12/24.
//

import XCTest
@testable import LTCTask

final class APIMockRequestModel: APIRequestProtocol {
    var endpoint: ServiceEndpoint {
        .none
    }
}

final class APIServiceManagerTests: XCTestCase {
    private var sut: APIServiceManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = APIServiceManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func test_urlSession() {
        XCTAssertNotNil(sut.urlSession, "The urlSession should not be nil.")
    }
    
    func test_DefaultMockAPIRequest() {
        let requestModel: APIRequestProtocol = APIMockRequestModel()
        XCTAssertEqual(requestModel.httpMethod, HttpMethod.POST)
        XCTAssertEqual(requestModel.endpoint, ServiceEndpoint.none)
        XCTAssertEqual(requestModel.timeoutInterval, 30)
    }
}
