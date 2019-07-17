//
//  WeatherData.swift
//  Sky
//
//  Created by yuan on 2019/6/20.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

struct WeatherData:Codable {
    let latitude: Double
    let longitude: Double
    let currently: CurrentWeather
    let daily: WeekWeatherData
    
    struct CurrentWeather:Codable {
        let time: Date
        let summary: String
        let icon: String
        let temperature: Double
        let humidity: Double
    }
    
    struct WeekWeatherData:Codable {
        let data: [ForecastData]
    }
}

extension WeatherData: Equatable{
    static func ==(lwc: WeatherData,rwc: WeatherData) -> Bool{
        return lwc.latitude == rwc.latitude &&
        lwc.longitude == rwc.longitude &&
        lwc.currently == rwc.currently
    }
}
extension WeatherData.CurrentWeather: Equatable{
    static func ==(
        lwc: WeatherData.CurrentWeather,
        rwc: WeatherData.CurrentWeather) -> Bool{
        return lwc.time == rwc.time &&
            lwc.summary == rwc.summary &&
            lwc.icon == rwc.icon &&
            lwc.temperature == rwc.temperature &&
            lwc.humidity == rwc.humidity
    }
}
extension WeatherData.WeekWeatherData: Equatable{
    static func ==(
        lwc: WeatherData.WeekWeatherData,
        rwc: WeatherData.WeekWeatherData) -> Bool{
        return lwc.data == rwc.data
    }
}
