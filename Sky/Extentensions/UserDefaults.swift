//
//  UserDefaults.swift
//  Sky
//
//  Created by yuan on 2019/7/19.
//  Copyright © 2019 Mars. All rights reserved.
//

import Foundation

enum DateMode: Int {
    case text
    case digit
    var format: String {
        return self == .text ? "E, dd MMMM" : "EEEEE, MM/dd"
    }
}
enum TemperatureMode: Int {
    case celsius
    case fahrenheit
    
}

struct UserDefaultKeys {
    static let dateMode = "dateMode"
    static let temperatureMode = "temperatureMode"
}

extension UserDefaults {
    static func dateMode() ->DateMode {
        let value = UserDefaults.standard.integer(forKey: UserDefaultKeys.dateMode)
        return DateMode(rawValue: value) ?? DateMode.text
    }
    static func setDateMode(to value: DateMode) {
        UserDefaults.standard.set(value.rawValue, forKey: UserDefaultKeys.dateMode)
    }
    static func temperatureMode() ->TemperatureMode {
        let value = UserDefaults.standard.integer(forKey: UserDefaultKeys.temperatureMode)
        return TemperatureMode(rawValue: value) ?? TemperatureMode.celsius
    }
    static func setTemperatureMode(to value: TemperatureMode) {
        UserDefaults.standard.set(value.rawValue, forKey: UserDefaultKeys.temperatureMode)
    }
}
