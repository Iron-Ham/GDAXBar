//
//  ProductStore.swift
//  GDAX
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

enum ProductStore: Store {
    typealias T = Product
    static var key: String { return UserDefaultKeys.products}
}
