//
//  Double.swift
//  Sky
//
//  Created by yuan on 2019/6/20.
//  Copyright © 2019 Mars. All rights reserved.
//

import Foundation

extension Double {
    func toCelcius() -> Double {
       return (self - 32.0) / 1.8
    }
}
