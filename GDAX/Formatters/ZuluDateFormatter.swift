//
//  ZuluDateFormatter.swift
//  GDAX
//
//  Created by Hesham Salman on 9/27/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

class ZuluDateFormatter: DateFormatter {
    override init() {
        super.init()
        configureFormat()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureFormat()
    }

    private func configureFormat() {
        dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
    }
}
