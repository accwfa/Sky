//
//  WeekWeatherViewController.swift
//  Sky
//
//  Created by yuan on 2019/6/21.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

class WeekWeatherViewController: WeatherViewController{

    @IBOutlet weak var weekWeatherTableView: UITableView!
   
    var viewModel: WeekWeatherViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateView()
            }
        }
    }
    func updateView(){
        activityIndicatorView.stopAnimating()
        if let _ = viewModel {
            self.updateWeatherContainer()
        }
        else {
            loadingFailedLabel.isHidden = false
            loadingFailedLabel.text = "loading Failed"
        }
    }
    
    func updateWeatherContainer() {
        weatherContainerView.isHidden = false
        weekWeatherTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        weekWeatherTableView.register(WeekWeatherTableViewCell.self, forCellReuseIdentifier: WeekWeatherTableViewCell.reuseIdentifier)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WeekWeatherViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let vm = viewModel else { return 0 }
        return vm.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = viewModel else { return 0 }
        return vm.numberOfDays
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WeekWeatherTableViewCell.reuseIdentifier, for: indexPath) as? WeekWeatherTableViewCell
        tableView.rowHeight = 104
        guard let row = cell else {
            fatalError("unexpected table view cell")
        }
        if let vm = viewModel {
            row.week.text = vm.week(for: indexPath.row)
            row.date.text = vm.date(for: indexPath.row)
            row.temperature.text = vm.temperature(for: indexPath.row)
            row.weatherIcon.image = vm.weatherIcon(for: indexPath.row)
            row.humidity.text = vm.humidity(for: indexPath.row)
            
        }
        return row
    }
     
}
