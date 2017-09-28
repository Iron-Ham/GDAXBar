//
//  CurrencyService.swift
//  GDAXBar
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

public struct CurrencyService: MultiService {
    typealias T = Currency
    var defaultEndpoint: GDAXService = .currencies
}
