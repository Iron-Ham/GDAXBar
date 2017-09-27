//
//  Service.swift
//  GDAX
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

protocol Service {
    associatedtype T: Codable

    static var endpoint: GDAXService { get }

    static func fetch(callback: @escaping ([T]?, NetworkingError?) -> Void)
}

extension Service {
    static func fetch(callback: @escaping ([T]?, NetworkingError?) -> Void) {
        _ = provider.request(endpoint) { result in
            switch result {
            case let .success(response):
                let currencies = try? decoder.decode([T].self, from: response.data)
                callback(currencies, nil)
            case .failure(_):
                callback(nil, NetworkingError.failedToFetch)
            }
        }
    }
}

private var decoder = JSONDecoder()
private var encoder = JSONEncoder()
private var provider = OnlineProvider<GDAXService>()
