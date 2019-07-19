//
//  WeekWeatherViewModel.swift
//  Sky
//
//  Created by yuan on 2019/6/21.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

struct WeekWeatherViewModel  {
    let weatherData : [ForecastData]
    private let dateFormatter = DateFormatter()
    
    func week(for index: Int) -> String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: weatherData[index].time)
    }
    func date(for index: Int) -> String {
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: weatherData[index].time)
    }
    
    func temperature(for index: Int) -> String {
        let min = format(temperature: weatherData[index].temperatureLow)
        let max = format(temperature: weatherData[index].temperatureHigh)
        return "\(min)-\(max)"
    }
    
    func weatherIcon(for index: Int) -> UIImage? {
        return UIImage.weatherIcon(of:weatherData[index].icon)!
    }
    
    func humidity(for index: Int) -> String {
        return String(format: "%.2f ", weatherData[index].humidity)
    }
    var numberOfRowsInSection: Int{
        return 1
    }
    
    var numberOfDays: Int{
        return weatherData.count
    }
    private func format(temperature: Double) -> String {
        switch UserDefaults.temperatureMode() {
        case .fahrenheit:
            return String(format: "%.1f ℉", temperature)
        default:
            return String(format: "%.1f ℃", temperature.toCelcius())
        }
    }
}
