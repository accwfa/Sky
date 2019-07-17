//
//  CurrentWeatherViewModel.swift
//  Sky
//
//  Created by yuan on 2019/6/21.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

struct CurrentWeatherViewModel {
    
    var isLocationReady = false
    var isWeatherReady = false
    var isReady: Bool {
        return isWeatherReady && isLocationReady
    }
    
     var location: Location! {
        didSet {
            if location != nil {
                self.isLocationReady = true
            }
            else {
                self.isLocationReady = false
            }
        }
    }
    var weather: WeatherData! {
        didSet {
            if weather != nil {
                self.isWeatherReady = true
            }
            else {
                self.isWeatherReady = false
            }
        }
    }
    
    var city: String {
        return location.name
    }
    
    var temperature: String {
        return String(format:"%.1f ℃", weather.currently.temperature.toCelcius())
    }

    var weatherIcon: UIImage {
        return UIImage.weatherIcon(of: weather.currently.icon)!
    }
    
    var humidity: String {
        return String(format: "%.1f", weather.currently.humidity)
    }
    
    var summary: String {
        return weather.currently.summary
    }
    
    var date: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "e, dd MMMM"
        return formatter.string(from: weather.currently.time)
    }
}
