//
//  CurrencyStore.swift
//  GDAXBar
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

public enum CurrencyStore: Store {
    public typealias T = Currency
    public static var key: String {
        return UserDefaultKeys.currencies
    }
}
