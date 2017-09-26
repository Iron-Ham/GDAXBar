//
//  CurrencyService.swift
//  GDAXBar
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

enum CurrencyService {

    private var decoder: JSONDecoder {
        return JSONDecoder()
    }

    static func fetch() -> [Currency]? {
        let decoder = JSONDecoder()
        let provider = OnlineProvider<GDAXService>()
        provider.request(.currencies) { result in
            switch result {
            case let .success(response):
                return try? decoder.decode(Currency.self, from: response.data)
            }
        }
    }
}


