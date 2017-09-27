//
//  Currency.swift
//  GDAXBar
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

public struct Currency: Codable {
    public let id: String
    public let name: String
    internal let _smallestDenomination: String
    public var smallestDenomination: Double { return Double(self._smallestDenomination)! }

    init(id: String, name: String, smallestDenomination: String) {
        self.id = id
        self.name = name
        self._smallestDenomination = smallestDenomination
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case _smallestDenomination = "min_size"
    }
}
