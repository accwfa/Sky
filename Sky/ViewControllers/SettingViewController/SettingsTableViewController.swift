//
//  SettingViewController.swift
//  Sky
//
//  Created by yuan on 2019/7/19.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func controllerDidChangeTimeMode(controller: SettingsViewController)
    func controllerDidChangeTemperatureMode(controller: SettingsViewController)
}

class SettingsViewController: UITableViewController {
    var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SettingsViewController {
    
    private enum Section: Int {
        case date
        case temperature
        
        var numberOfRows: Int {
            return 2
        }
        static var count: Int {
            return Section.temperature.rawValue + 1
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            fatalError(" section index err")
        }
        return section.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Date format"
        }
        return "Temperature unit"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier, for: indexPath) as? SettingsTableViewCell else {
            fatalError("table cell")
        }
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError("section index")
        }
        switch section {
        case .date:
            cell.label.text = (indexPath.row == 0) ? "Fri, 01 December" : "F,12/01"
            let timeMode = UserDefaults.dateMode()
            if indexPath.row == timeMode.rawValue {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
        case .temperature:
            cell.label.text = (indexPath.row == 0) ? "Celcius" : "Fahrenheit"
            let temperatureMode = UserDefaults.temperatureMode()
            if indexPath.row == temperatureMode.rawValue {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
        }
        tableView.rowHeight = 44
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let section = Section(rawValue: indexPath.section) else {
            fatalError("errrrrr")
        }
        switch section {
        case .date:
            let dateMode = UserDefaults.dateMode()
            guard indexPath.row != dateMode.rawValue else { return }
            if let newMode = DateMode(rawValue: indexPath.row) {
                UserDefaults.setDateMode(to: newMode)
            }
            delegate?.controllerDidChangeTimeMode(controller: self)
        case .temperature:
            let temperatureMode = UserDefaults.temperatureMode()
            guard indexPath.row != temperatureMode.rawValue else { return }
            if let newMode = TemperatureMode(rawValue: indexPath.row) {
                UserDefaults.setTemperatureMode(to: newMode)
            }
            delegate?.controllerDidChangeTemperatureMode(controller: self)
        }
        let sections = IndexSet(integer: indexPath.section)
        tableView.reloadSections(sections, with: .none)
    }
}
