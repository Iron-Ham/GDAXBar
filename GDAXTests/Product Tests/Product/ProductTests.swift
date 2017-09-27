//
//  ProductTests.swift
//  GDAXTests
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation
import XCTest
import Moya

@testable import GDAX
class ProductTests: XCTestCase {
    var provider: OnlineProvider<GDAXService>!

    override func setUp() {
        provider = OnlineProvider(stubClosure: MoyaProvider.immediatelyStub)
        CurrencyStore.storedValues = [
            Currency(id: "USD", name: "dolla dolla bill", smallestDenomination: "0.01"),
            Currency(id: "BTC", name: "Batmancoin", smallestDenomination: "0.0000001")
        ]
    }

    func test_decoding() {
        let decoder = JSONDecoder()
        let dataRetreivalExpectation = expectation(description: "received data")
        _ = provider.request(.products) { result in
            if case let .success(response) = result {
                let products = try? decoder.decode([Product].self, from: response.data)
                XCTAssertNotNil(products)
                XCTAssertEqual(products?.count, 1)
                var product = products!.first!
                XCTAssertNotNil(product.quoteCurrency)
                XCTAssertNotNil(product.baseCurrency)
                XCTAssertNotNil(product.baseMinSize)
                XCTAssertNotNil(product.baseMaxSize)
                XCTAssertNotNil(product.quoteIncrement)
                dataRetreivalExpectation.fulfill()
            }
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }

}
