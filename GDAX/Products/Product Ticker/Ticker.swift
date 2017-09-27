//
//  Ticker.swift
//  GDAX
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

public struct Ticker: Codable  {
    internal let _price: String
    internal let _size: String
    internal let _bid: String
    internal let _ask: String
    internal let _volume: String
    internal let _time: String

    public let tradeId: Int
    public var price: Double { return Double(_price)! }
    public var size: Double { return Double(_size)! }
    public var bid: Double { return Double(_bid)! }
    public var ask: Double { return Double(_ask)! }
    public var volume: Double { return Double(_volume)! }
    public var time: Date { return dateFormatter.date(from: _time)! }

    enum CodingKeys: String, CodingKey {
        case tradeId = "trade_id"
        case _price = "price"
        case _size = "size"
        case _bid = "bid"
        case _ask = "ask"
        case _volume = "volume"
        case _time = "time"
    }
}

private let dateFormatter = ZuluDateFormatter()
