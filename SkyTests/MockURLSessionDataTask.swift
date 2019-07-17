//
//  MockURLSessionDataTask.swift
//  SkyTests
//
//  Created by yuan on 2019/6/20.
//  Copyright © 2019 Mars. All rights reserved.
//

import Foundation
@testable import Sky
class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var isResumeCalled = false
    func resume() {
        self.isResumeCalled = true
    }
}
