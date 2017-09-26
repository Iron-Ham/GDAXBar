//
//  Currency.swift
//  GDAXBar
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation
import Moya

struct Currency: Codable {
    let id: String
    let name: String
    let smallestDenomination: Double

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case smallestDenomination = "min_size"
    }
}
