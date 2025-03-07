//
//  APIServiceTest.swift
//  CryptoMasterTests
//
//  Created by robin on 06/03/25.
//

import XCTest
@testable import CryptoMaster
final class APIServiceTest: XCTestCase {
    
    var apiService: APIService!
    var cryptos: [Cryptocurrency] = []
    
    override func setUp() {
        super.setUp()
        apiService = APIService()
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiService = nil
    }

    func testFetchData_Success() {
        
        let expectation = self.expectation(description: "API call success")

        APIService.fetchCryptoCurrencyData { cryptos in
            
            if (cryptos != nil)  {
                expectation.fulfill()}
            else{
                XCTFail("Expected success but got failure")
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }

}
