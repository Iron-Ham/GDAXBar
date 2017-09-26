//
//  Product.swift
//  GDAXBar
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let id: String
    let baseCurrency: Currency
    let quoteCurrency: Currency
    let baseMinSize: Double
    let baseMaxSize: Double
    let quoteIncrement: Double

    
}

/**
 {
 "id": "BTC-USD",
 "base_currency": "BTC",
 "quote_currency": "USD",
 "base_min_size": "0.01",
 "base_max_size": "10000.00",
 "quote_increment": "0.01"
 }
 **/
