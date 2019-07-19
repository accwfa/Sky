//
//  SettingTableViewCell.swift
//  Sky
//
//  Created by yuan on 2019/7/19.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    static let reuseIdentifier = "SettingTableViewCell"
    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}


