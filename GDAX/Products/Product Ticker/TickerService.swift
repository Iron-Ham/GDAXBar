//
//  TickerService.swift
//  GDAX
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation
public enum TickerService {
    static func fetch(product: Product, callback: @escaping (Ticker?, NetworkingError?) -> Void) {
        _ = provider.request(.ticker(product)) { result in
            switch result {
            case let .success(response):
                let ticker = try? decoder.decode(Ticker.self, from: response.data)
                callback(ticker, nil)
            case .failure(_):
                callback(nil, .failedToFetch)
            }
        }
    }
}

private var decoder = JSONDecoder()
private var encoder = JSONEncoder()
private var provider = OnlineProvider<GDAXService>()
