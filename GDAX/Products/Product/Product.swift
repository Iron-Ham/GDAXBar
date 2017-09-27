//
//  Product.swift
//  GDAXBar
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

public struct Product: Codable {
    internal let _quoteIncrement: String
    internal let _baseCurrency: String
    internal let _quoteCurrency: String
    internal let _baseMinSize: String
    internal let _baseMaxSize: String

    public let id: String
    public lazy var baseCurrency: Currency? = { CurrencyStore.storedValues.first(where: { $0.id == self._baseCurrency }) }()
    public lazy var quoteCurrency: Currency? = { CurrencyStore.storedValues.first(where: { $0.id == self._quoteCurrency }) }()
    public var baseMinSize: Double { return Double(_baseMinSize)! }
    public var baseMaxSize: Double { return Double(_baseMaxSize)! }
    public var quoteIncrement: Double { return Double(_quoteIncrement)! }

    enum CodingKeys: String, CodingKey {
        case id
        case _baseCurrency = "base_currency"
        case _quoteCurrency = "quote_currency"
        case _baseMinSize = "base_min_size"
        case _baseMaxSize = "base_max_size"
        case _quoteIncrement = "quote_increment"
    }
}
