//
//  Configuration.swift
//  Sky
//
//  Created by yuan on 2019/6/20.
//  Copyright © 2019 Mars. All rights reserved.
//

import Foundation

struct API{
    static let key = "fb0212119c511a8e1c5debae5c4f3557"
    static let baseURL = URL(string: "https://api.darksky.net/forecast/")!
    static let authenticatiedURL = baseURL.appendingPathComponent(key)
}
