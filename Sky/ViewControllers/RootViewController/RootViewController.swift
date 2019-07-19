//
//  RootViewController.swift
//  Sky
//
//  Created by Mars on 28/09/2017.
//  Copyright © 2017 Mars. All rights reserved.
//

import UIKit
import CoreLocation

class RootViewController: UIViewController {

    var currentWeatherViewController: CurrentWeatherViewController!
    var weekWeatherViewController: WeekWeatherViewController!
    private let segueCurrentWeather = "SegueCurrentWeather"
    private let segueWeekWeather = "SegueWeekWeather"
    private let segueSettings = "SegueSettings"
    
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case segueCurrentWeather:
            guard let destination = segue.destination as? CurrentWeatherViewController else {
                fatalError("Invalid destination view vontroller")
            }
            destination.delegate = self
            destination.viewModel = CurrentWeatherViewModel()
            currentWeatherViewController = destination
            
        case segueWeekWeather:
            guard let destination = segue.destination as? WeekWeatherViewController else {
                fatalError("Invalid destination view vontroller")
            }
            weekWeatherViewController = destination
         
        case segueSettings:
            guard let nav = segue.destination as? UINavigationController else { fatalError("Invalid Nav") }
            guard let des = nav.topViewController as? SettingsViewController else { fatalError("Invalid Des") }
            des.delegate = self
        default:
            break
        }
    }
    
    private var currentLocation: CLLocation? {
        didSet {
            fetchCity()
            
            fecthWeather()
        }
    }
    
    private func fecthWeather(){
        guard let currentLocation = currentLocation else {return}
        let la = currentLocation.coordinate.latitude
        let lo = currentLocation.coordinate.longitude
        WeatherDataManager.shared.weatherDataAt(latitude: la, longitude: lo, completion: {
            response, error in
            if let error = error {
                dump(error)
            }
            else if let response = response {
                // notify current weathercontroller
                self.currentWeatherViewController.viewModel?.weather = response
                self.weekWeatherViewController.viewModel = WeekWeatherViewModel(weatherData: response.daily.data)
            }
        })
    }
    private func fetchCity(){
        guard let currentLocation = currentLocation else {return}
        CLGeocoder().reverseGeocodeLocation(currentLocation, completionHandler: {
            placemark, error in
            if let error = error {
                dump(error)
            }
            else if let city = placemark?.first?.locality{
                //notify current weathercontroller
                let l = Location(name:city ,latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
                self.currentWeatherViewController.viewModel?.location = l
            }
        })
    }
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.distanceFilter = 1000
        manager.desiredAccuracy = 1000
        return manager
    }()
    
    private func requestLocation(){
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.requestLocation()
        }else{
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActiveNotification()
    }

    @objc func applicationDidBecomeActive(notification: Notification){
        requestLocation()
        
    }
    private func setupActiveNotification(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(RootViewController.applicationDidBecomeActive(notification:)),
                                               name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
    }
    
}

extension RootViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            currentLocation = location
            print(currentLocation!.coordinate.latitude,currentLocation!.coordinate.longitude)
            manager.delegate = nil
            manager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        dump(error)
    }
}

extension RootViewController: CurrentWeatherViewControllerDelegate {
    func locationButtonPressed(controller: CurrentWeatherViewController) {
        print("locationButtonPressed")
    }
    
    func settingsButtonPressed(controller: CurrentWeatherViewController) {
        print("settingsButtonPressed")
    }
}

extension RootViewController: SettingsViewControllerDelegate {
    private func reloadUI() {
        currentWeatherViewController.updateView()
        weekWeatherViewController.updateView()
    }
    func controllerDidChangeTimeMode(controller: SettingsViewController) {
        reloadUI()
    }
    func controllerDidChangeTemperatureMode(controller: SettingsViewController) {
        reloadUI()
    }
}
