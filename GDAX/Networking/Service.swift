//
//  Service.swift
//  GDAX
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

typealias Service = SingleService & MultiService

protocol BaseService {
    static var defaultEndpoint: GDAXService? { get }
}

extension BaseService {
    static var defaultEndpoint: GDAXService? {
        return nil
    }
}

protocol MultiService: BaseService {
    associatedtype T: Codable

    static func fetchValues(endpoint: GDAXService, callback: @escaping ([T]?, NetworkingError?) -> Void)
    static func fetchValues(callback: @escaping ([T]?, NetworkingError?) -> Void)
}

protocol SingleService: BaseService {
    associatedtype T: Codable

    static var defaultEndpoint: GDAXService? { get }

    static func fetchValue(endpoint: GDAXService, callback: @escaping (T?, NetworkingError?) -> Void)
    static func fetchValue(callback: @escaping (T?, NetworkingError?) -> Void)
}

extension SingleService {
    static func fetchValue(endpoint: GDAXService, callback: @escaping (T?, NetworkingError?) -> Void) {
        _ = provider.request(endpoint) { result in
            switch result {
            case let .success(response):
                let value = try? decoder.decode(T.self, from: response.data)
                callback(value, nil)
            case .failure(_):
                callback(nil, .failedToFetch)
            }
        }
    }
    static func fetchValue(callback: @escaping (T?, NetworkingError?) -> Void) {
        guard let endpoint = defaultEndpoint else { return }
        fetchValue(endpoint: endpoint, callback: callback)
    }
}

extension MultiService {
    static func fetchValues(endpoint: GDAXService, callback: @escaping ([T]?, NetworkingError?) -> Void) {
        _ = provider.request(endpoint) { result in
            switch result {
            case let .success(response):
                let values = try? decoder.decode([T].self, from: response.data)
                callback(values, nil)
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
