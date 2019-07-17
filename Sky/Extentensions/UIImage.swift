//
//  UIImage.swift
//  Sky
//
//  Created by yuan on 2019/6/21.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func weatherIcon(of name:String) -> UIImage?{
        switch name {
        case "clear-day":
            return UIImage(named: "clear-day")
        case "clear-night":
            return UIImage(named: "clear-night")
        case "cloudy":
            return UIImage(named: "cloudy")
        case "fog":
            return UIImage(named: "fog")
        case "partly-cloudy-day":
            return UIImage(named: "partly-cloudy-day")
        case "partly-cloudy-night":
            return UIImage(named: "partly-cloudy-night")
        case "rain":
            return UIImage(named: "rain")
        case "sleet":
            return UIImage(named: "sleet")
        case "snow":
            return UIImage(named: "snow")
        case "wind":
            return UIImage(named: "wind")
        default:
            return UIImage(named: "clear-day")
        }
    }
}
