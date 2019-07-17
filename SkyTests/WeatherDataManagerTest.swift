//
//  WeatherDataManagerTest.swift
//  SkyTests
//
//  Created by yuan on 2019/6/20.
//  Copyright © 2019 Mars. All rights reserved.
//

import XCTest
@testable import Sky
class WeatherDataManagerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_isResumed() {
        let session = MockURLSession()
        let dataTask = MockURLSessionDataTask()
        session.sessionDataTask = dataTask
        let manager = WeatherDataManager(baseURL: URL(string: "https://api.darksky.net")!, urlSession: session)
        manager.weatherDataAt(latitude: 50, longitude: 50, completion: {_ ,_ in})
        XCTAssert(session.sessionDataTask.isResumeCalled)
    }
    func test_getData() {
//        let data: WeatherData? = nil
        WeatherDataManager.shared.weatherDataAt(latitude: 50, longitude: 50, completion: {data ,error in})
//        XCTAssert(data)
    }
    
    func test_response_decode(){
        let session = MockURLSession()
        session.responseHeader = HTTPURLResponse(url: URL(string: "https://darksky.net")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        let data = """
        {
        "latitude": 50,
        "longitude": 100,
        "currently": {
            "time": 1560993412,
            "summary": "light Snow",
            "icon": "snow",
            "temperature": 60.19,
            "humidity": 0.87
            }
        }
        """.data(using: .utf8)!
        
        session.responseData = data
        var decoded: WeatherData? = nil
        let manager = WeatherDataManager(
            baseURL: URL(string: "https://darksky.net")!, urlSession: session
        )
        manager.weatherDataAt(latitude: 50, longitude: 100, completion: {d, _ in
            decoded = d
        })
        let expected = WeatherData(
            latitude: 50,
            longitude: 100,
            currently: WeatherData.CurrentWeather(
                time: Date(timeIntervalSince1970: 1560993412),
                summary: "light Snow",
                icon: "snow",
                temperature: 60.19,
                humidity: 0.87
            )
        )
        
        XCTAssertEqual(decoded, expected)
    }
}
