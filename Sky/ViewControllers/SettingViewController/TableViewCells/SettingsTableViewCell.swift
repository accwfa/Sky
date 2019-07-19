//
//  SettingsTableViewCell.swift
//  Sky
//
//  Created by yuan on 2019/7/19.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    static let reuseIdentifier = "SettingsTableViewCell"
    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}


