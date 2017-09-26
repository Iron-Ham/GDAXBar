//
//  CurrencyService.swift
//  GDAXBar
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation
import Result

struct CurrencyService {
    static func fetch(callback: @escaping ([Currency]?, NetworkingError?) -> Void) {
        let decoder = JSONDecoder()
        let provider = OnlineProvider<GDAXService>()
        _ = provider.request(.currencies) { result in
            switch result {
            case let .success(response):
                let currencies = try? decoder.decode([Currency].self, from: response.data)
                callback(currencies, nil)
            case .failure(_):
                callback(nil, NetworkingError.failedToFetch)
            }
        }
    }
}

enum NetworkingError: Error {
    case failedToFetch

    var localizedDescription: String {
        switch self {
        case .failedToFetch:
            return "Failed to fetch data"
        }
    }
}
