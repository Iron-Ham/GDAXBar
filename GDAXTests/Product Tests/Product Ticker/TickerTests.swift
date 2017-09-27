//
//  TickerTests.swift
//  GDAXTests
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation
import XCTest
import Moya

@testable import GDAX
class TickerTests: XCTestCase {

    var provider: OnlineProvider<GDAXService>!
    var product: Product!
    var btc: Currency!
    var usd: Currency!
    var ticker: Ticker!

    override func setUp() {
        usd = Currency(id: "USD", name: "dolla dolla bill", smallestDenomination: "0.01")
        btc = Currency(id: "BTC", name: "Batmancoin", smallestDenomination: "0.0000001")
        CurrencyStore.storedValues = [usd, btc]
        provider = OnlineProvider(stubClosure: MoyaProvider.immediatelyStub)
        product = Product(_quoteIncrement: "0.01", _baseCurrency: "BTC", _quoteCurrency: "USD", _baseMinSize: "0.01", _baseMaxSize: "10.0", id: "BTC-USD", baseCurrency: btc, quoteCurrency: usd)
        ticker = Ticker(_price: "1.00", _size: "234", _bid: "0.99", _ask: "1.01", _volume: "200", _time: "2015-11-14T20:46:03.511254Z", tradeId: 123)
    }

    func test_decoding() {
        let decoder = JSONDecoder()
        let dataRetreivalExpectation = expectation(description: "received data")
        _ = provider.request(.ticker(product)) { result in
            if case let .success(response) = result {
                let ticker = try? decoder.decode(Ticker.self, from: response.data)
                XCTAssertNotNil(ticker)
                dataRetreivalExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func test_values() {
        XCTAssertNotNil(ticker.time)
        XCTAssertNotNil(ticker.price)
        XCTAssertNotNil(ticker.size)
        XCTAssertNotNil(ticker.bid)
        XCTAssertNotNil(ticker.ask)
        XCTAssertNotNil(ticker.volume)
        XCTAssertNotNil(ticker.time)
    }

}
