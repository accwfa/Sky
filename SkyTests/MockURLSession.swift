//
//  MockURLSession.swift
//  SkyTests
//
//  Created by yuan on 2019/6/20.
//  Copyright © 2019 Mars. All rights reserved.
//

import Foundation
@testable import Sky

class MockURLSession: URLSessionProtocol {
    var responseData: Data?
    var responseHeader: HTTPURLResponse?
    var responseError: Error?
    var sessionDataTask = MockURLSessionDataTask()
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.dataTaskHandler) -> URLSessionDataTaskProtocol {
        completionHandler(responseData,responseHeader,responseError)
        return sessionDataTask
    }
}
