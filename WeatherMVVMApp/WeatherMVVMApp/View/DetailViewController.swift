//
//  DetailViewController.swift
//  WeatherMVVMApp
//
//  Created by param on 6/14/19.
//  Copyright © 2019 param. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var weatherInfo: WeatherInfo?
    
    @IBOutlet weak var lblWind: UILabel!
    @IBOutlet weak var lblTemperature: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWind.text = weatherInfo?.cityWindSpeed
        lblTemperature.text = weatherInfo?.cityTemperature

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
