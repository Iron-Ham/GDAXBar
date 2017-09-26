//
//  CurrencyTests.swift
//  GDAXBarTests
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation
import XCTest
import Moya

@testable import GDAX
class CurrencyTests: XCTestCase {

    var provider: OnlineProvider<GDAXService>!

    override func setUp() {
        provider = OnlineProvider(stubClosure: MoyaProvider.immediatelyStub)
    }

    func test_decoding() {
        let decoder = JSONDecoder()
        let dataRetreivalExpectation = expectation(description: "received data")
        _ = provider.request(.currencies) { result in
            if case let .success(response) = result {
                let currencies = try? decoder.decode([Currency].self, from: response.data)
                XCTAssertNotNil(currencies)
                XCTAssertEqual(currencies?.count, 2)
                dataRetreivalExpectation.fulfill()
            }
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func test_smallestDenomination() {
        let currency = Currency(id: "BHD", name: "Bahraini Dinar", smallestDenomination: "0.001")
        XCTAssertEqual(Double(currency._smallestDenomination), currency.smallestDenomination)
    }
}
