//
//  Defaults.swift
//  Meedies
//
//  Created by Misha Causur on 15.01.2022.
//

import Foundation

@propertyWrapper
struct Defaults<T> {
    let key: String
    private var storage: UserDefaults = .standard
    
    var wrappedValue: T? {
        get {
            storage.value(forKey: key) as? T
        }
        set {
            storage.setValue(newValue, forKey: key)
        }
    }
}
