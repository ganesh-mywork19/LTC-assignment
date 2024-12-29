//
//  ListRowViewTests.swift
//  LTCTaskTests
//
//  Created by Ganesh Guturi on 28/12/24.
//

import XCTest
@testable import LTCTask

final class ListRowViewTests: XCTestCase {
    private var sut: ListRowView!
    private let title = "ListRowView"
    private let imageURL = URL(string: "https://www.apple.com")
    private let spacing = 15.0

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        sut = ListRowView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func test_View_Params() {
        sut = ListRowView(title: title, imageURL: imageURL, spacing: spacing)
        XCTAssertEqual(title, sut.title)
        XCTAssertEqual(imageURL, sut.imageURL)
        XCTAssertEqual(spacing, sut.spacing)
    }
    
    func test_View_Default_Params() {
        sut = ListRowView(title: title, imageURL: imageURL)
        XCTAssertEqual(spacing, sut.spacing)
    }
}
