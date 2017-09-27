//
//  CurrencyService.swift
//  GDAXBar
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

public enum CurrencyService: Service {
    typealias T = Currency
    static var endpoint: GDAXService = .currencies
}
