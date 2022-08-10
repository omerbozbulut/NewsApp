//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by omer faruk bozbulut on 23.07.2022.
//

import XCTest
@testable import NewsApp

class ServiceManagerTests: XCTestCase {

    private var webService: WebService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        webService = .init()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        webService = nil
    }

    func testFetchArticles() {
        let status = "ok"
        var responseData: BaseResponse?
        let expectation = XCTestExpectation(description: "Succeed")
        webService.fetchNews(category: nil) { response in
            if !response.articles.isEmpty {
                responseData = response
                expectation.fulfill()
            }
        } onError: { _ in }

        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(responseData?.status, status)
    }

    func testSearchArticles(){
        let status = "ok"
        var responseData: BaseResponse?
        let expectation = XCTestExpectation(description: "Succeed")
        webService.fetchSearchNews(searchText: "Word", startingDate: "2022-08-03", endDate: "2022-08-03") { response in
            if !response.articles.isEmpty {
                responseData = response
                expectation.fulfill()
            }
        } onError: { _ in }

        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(responseData?.status, status)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
