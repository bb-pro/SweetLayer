//
//  UserDataConfiguration.swift
//  SweetLayers
//
//  Created by 1 on 17/01/25.
//

import Foundation

class UserDataConfiguration {
    static let shared = UserDataConfiguration()
    let coins = "coins"
    let levels = "levels"
    let blower = "blower"
    let timer = "timer"
    let defaults = UserDefaults.standard

    func setInitialValues() {
        if defaults.value(forKey: coins) == nil {
            defaults.setValue(60, forKey: coins)
        }
        if defaults.value(forKey: levels) == nil {
            defaults.setValue([0], forKey: levels)
        }
        if defaults.value(forKey: blower) == nil {
            defaults.setValue(0, forKey: blower)
        }
        if defaults.value(forKey: timer) == nil {
            defaults.setValue(0, forKey: timer)
        }
    }
    
    func updateValues(key: String, value: Any) {
        defaults.setValue(value, forKey: key)
    }
    
    func getValueOfKey(key: String) -> Any {
        return defaults.value(forKey: key) as Any
    }
    
    func getCoins() -> Int {
        return defaults.value(forKey: coins) as! Int
    }
}
