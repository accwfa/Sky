//
//  ForecastData.swift
//  Sky
//
//  Created by yuan on 2019/6/21.
//  Copyright © 2019 Mars. All rights reserved.
//

import Foundation

struct ForecastData: Codable {
    var time: Date
    var temperatureHigh: Double
    var temperatureLow: Double
    var icon: String
    var humidity: Double
}

extension ForecastData: Equatable {
    static func ==(
        lwc: ForecastData,
        rwc: ForecastData) -> Bool {
        return lwc.time == rwc.time &&
            lwc.temperatureHigh == rwc.temperatureHigh &&
            lwc.icon == rwc.icon &&
            lwc.temperatureLow == rwc.temperatureLow &&
            lwc.humidity == rwc.humidity
    }
}
