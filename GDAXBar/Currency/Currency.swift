//
//  Currency.swift
//  GDAXBar
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation
import Moya

struct Currency: Decodable {
    let id: String
    let name: String
    private let _smallestDenomination: String
    var smallestDenomination: Double {
        guard let value = Double(self._smallestDenomination) else {
            fatalError()
        }
        return value
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case _smallestDenomination = "min_size"
    }
}
