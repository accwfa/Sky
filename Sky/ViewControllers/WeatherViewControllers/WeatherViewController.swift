//
//  WeatherViewController.swift
//  Sky
//
//  Created by yuan on 2019/6/20.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherContainerView: UIView!
    @IBOutlet weak var loadingFailedLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    private func setupView(){
        weatherContainerView.isHidden = true
        loadingFailedLabel.isHidden = true
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidesWhenStopped = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
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
