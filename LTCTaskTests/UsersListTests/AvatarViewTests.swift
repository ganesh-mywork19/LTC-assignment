//
//  AvatarViewTests.swift
//  LTCTaskTests
//
//  Created by Ganesh Guturi on 27/12/24.
//

import XCTest
@testable import LTCTask

final class AvatarViewTests: XCTestCase {
    private var sut: AvatarView!
    private let imageURL = URL(string: "https://www.apple.com")
    private let size = min(UIScreen.width * 0.15, 60)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        sut = AvatarView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func test_View_Params() {
        sut = AvatarView(imageURL, size: size)
        XCTAssertEqual(imageURL?.absoluteString, sut.imageURL?.absoluteString)
        XCTAssertEqual(size, sut.size)
    }
    
    func test_View_Default_Params() {
        sut = AvatarView(imageURL)
        XCTAssertEqual(size, sut.size)
    }
}



