//
//  ProductService.swift
//  GDAX
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

struct ProductService: MultiService {
    typealias T = Product

    var defaultEndpoint: GDAXService = .products
}

enum ExampleService: Service {
    typealias T = Int
}
