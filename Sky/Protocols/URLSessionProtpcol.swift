//
//  URLSessionProtpcol.swift
//  Sky
//
//  Created by yuan on 2019/6/20.
//  Copyright © 2019 Mars. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    typealias dataTaskHandler = (Data?, URLResponse?, Error?) -> Void
    func dataTask(with request: URLRequest, completionHandler: @escaping dataTaskHandler) -> URLSessionDataTaskProtocol
    
}
