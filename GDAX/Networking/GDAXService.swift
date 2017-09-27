//
//  GDAXService.swift
//  GDAXBar
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation
import Moya

enum GDAXService {
    case currencies
    case products
}

extension GDAXService: TargetType {
    var baseURL: URL { return URL(string: "https://api.gdax.com")! }
    var path: String {
        switch self {
        case .currencies:
            return "/currencies"
        case .products:
            return "/products"
        }
    }
    var method: Moya.Method {
        switch self {
        case .currencies, .products:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .currencies, .products:
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .currencies:
            return stubbedResponse("Currencies")
        case .products:
            return stubbedResponse("Products")
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

func stubbedResponse(_ filename: String) -> Data! {
    let bundle = Bundle(identifier: "com.heshamsalman.GDAXTests")
    let path = bundle?.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
