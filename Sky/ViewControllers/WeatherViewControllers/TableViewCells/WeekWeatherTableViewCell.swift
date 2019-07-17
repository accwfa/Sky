//
//  WeekWeatherTableViewCell.swift
//  Sky
//
//  Created by yuan on 2019/6/21.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

class WeekWeatherTableViewCell: UITableViewCell {

    static let reuseIdentifier = "weekWeatherCell"
    
    
    @IBOutlet weak var week: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var humidity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
