//
//  NewsDemoTests.swift
//  NewsDemoTests
//
//  Created by Thai Nguyen Quang on 11/26/21.
//

import XCTest

@testable import NewsDemo

class NewsDemoTests: XCTestCase {
    
    let url = URL(string: Constant.AppUrl.feed.rawValue)!
    override func setUp() {
        // Setup URLSession for mockup and testing
    }
    
    /// Test valid response - read data from simulated json file
    func testProperResponse() {
        //ValidResponse
        let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=ff22005d7cff4821a6d1f75ae66e19f2"

     //       let testExpectation = expectation(description: "Successful response from endpoint")
            let viewModel = NewsListViewModel()

            viewModel.getNews(_url:url) { (_) in
                print("", viewModel.newsVM.count)
                XCTAssert(viewModel.newsVM.count == 0, "Unexpected error occurred")
                XCTAssert(viewModel.newsVM.count == 2, "Feed list count not matching")
                XCTAssert(viewModel.newsVM[0].title == "Covid_Live_Updates", "Data source info mismatch")
  //              testExpectation.fulfill()
            }
//            wait(for: [testExpectation], timeout: 10)
      
    }
    
    // Test invalid response
    func testInvalidResponse() { //
        //ValidResponse
        let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
            let viewModel = NewsListViewModel()        
            viewModel.getNews(_url:url) { (_) in
                XCTAssert(viewModel.newsVM.count == 0, "Unexpected error occurred")
                XCTAssert(viewModel.newsVM.count == 2, "Feed list count not matching")
                XCTAssert(viewModel.newsVM[0].title == "Covid_Live_Updates", "Data source info mismatch")
            }
    }
    
    /// Test API error
    func testAPIError() {
        let url =  ""
    //    let testExpectation = expectation(description: "Expecting API error from service")
        let viewModel = NewsListViewModel()
    
        viewModel.getNews(_url: url) { (_) in
            print( viewModel.newsVM);
            XCTAssert(viewModel.newsVM.count == 0, "Feed list should be nil")
   //         testExpectation.fulfill()
        }
      //  wait(for: [testExpectation], timeout: 3)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
