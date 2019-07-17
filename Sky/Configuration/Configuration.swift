//
//  Configuration.swift
//  Sky
//
//  Created by yuan on 2019/6/20.
//  Copyright © 2019 Mars. All rights reserved.
//

import Foundation

struct API{
    static let key = "acd75abf62e91b678f4eb530b7296de6"
    static let baseURL = URL(string: "https://api.darksky.net/forecast/")!
    static let authenticatiedURL = baseURL.appendingPathComponent(key)
}
