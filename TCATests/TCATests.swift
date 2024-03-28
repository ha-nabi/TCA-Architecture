//
//  TCATests.swift
//  TCATests
//
//  Created by 강치우 on 1/12/24.
//


import ComposableArchitecture
import XCTest

@MainActor
final class TCATests: XCTestCase {
//    func testIncrementInFirstTab() async {
//        let store = TestStore(initialState: AppFeature.State()) {
//            AppFeature()
//        }
//        
//        await store.send(\.tab1.incrementButtonTapped) {
//            $0.tab1.count = 1
//        }
//    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
