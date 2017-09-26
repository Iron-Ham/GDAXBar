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
}

extension GDAXService: TargetType {
    var baseURL: URL { return URL(string: "https://api.gdax.com")! }
    var path: String {
        switch self {
        case .currencies:
            return "/currencies"
        }
    }
    var method: Moya.Method {
        switch self {
        case .currencies:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .currencies:
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .currencies:
            return stubbedResponse("Currencies")
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

func stubbedResponse(_ filename: String) -> Data! {
    @objc class TestClass: NSObject { }

    let bundle = Bundle(for: TestClass.self)
    let path = bundle.path(forResource: filename, ofType: "json")
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
