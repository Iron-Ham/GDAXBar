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

    static var defaultEndpoint: GDAXService? { get }

    static func fetchValues(endpoint: GDAXService, callback: @escaping ([T]?, NetworkingError?) -> Void)
    static func fetchValues(callback: @escaping ([T]?, NetworkingError?) -> Void)

    static func fetchValue(endpoint: GDAXService, callback: @escaping (T?, NetworkingError?) -> Void)
    static func fetchValue(callback: @escaping (T?, NetworkingError?) -> Void)
}

extension Service {
    static var defaultEndpoint: GDAXService? {
        return nil
    }

    static func fetchValue(endpoint: GDAXService, callback: @escaping (T?, NetworkingError?) -> Void) {
        _ = provider.request(endpoint) { result in
            switch result {
            case let .success(response):
                let currencies = try? decoder.decode(T.self, from: response.data)
                callback(currencies, nil)
            case .failure(_):
                callback(nil, .failedToFetch)
            }
        }
    }
    static func fetchValue(callback: @escaping (T?, NetworkingError?) -> Void) {
        guard let endpoint = defaultEndpoint else { return }
        fetchValue(endpoint: endpoint, callback: callback)
    }

    static func fetchValues(endpoint: GDAXService, callback: @escaping ([T]?, NetworkingError?) -> Void) {
        _ = provider.request(endpoint) { result in
            switch result {
            case let .success(response):
                let currencies = try? decoder.decode([T].self, from: response.data)
                callback(currencies, nil)
            case .failure(_):
                callback(nil, .failedToFetch)
            }
        }
    }
    static func fetchValues(callback: @escaping ([T]?, NetworkingError?) -> Void) {
        guard let endpoint = defaultEndpoint else { return }
        fetchValues(endpoint: endpoint, callback: callback)
    }
}

private var decoder = JSONDecoder()
private var encoder = JSONEncoder()
private var provider = OnlineProvider<GDAXService>()
