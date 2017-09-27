//
//  NetworkingError.swift
//  GDAX
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

public enum NetworkingError: Error {
    case failedToFetch

    var localizedDescription: String {
        switch self {
        case .failedToFetch:
            return "Failed to fetch data"
        }
    }
}
