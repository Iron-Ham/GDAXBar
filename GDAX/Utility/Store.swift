//
//  Store.swift
//  GDAX
//
//  Created by Hesham Salman on 9/26/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import Foundation

public protocol Store {
    associatedtype T: Codable

    static var key: String { get }

    static var storedValues: [T] { get set }
}

public extension Store {
    public static var storedValues: [T] {
        get {
            guard let data = UserDefaults.standard.data(forKey: key) else {
                return []
            }
            return (try? decoder.decode([T].self, from: data)) ?? []
        }

        set {
            guard let data = try? encoder.encode(newValue) else {
                return
            }
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

private let encoder = JSONEncoder()
private let decoder = JSONDecoder()
