//
//  WeatherInfo.swift
//  WeatherMVVMApp
//
//  Created by param on 6/13/19.
//  Copyright © 2019 param. All rights reserved.
//

import Foundation

class WeatherInfo: NSObject {
    
    var cityTemperature:String = ""
    var cityWeatherIcon:String = ""
    var cityWindSpeed: String  = ""
    var cityName:String        = ""
    
    init(temperature:String, weatherIconName:String, windSpeed:String,name:String) {
        
        self.cityTemperature            = temperature
        self.cityWeatherIcon            = weatherIconName
        self.cityWindSpeed               = windSpeed
        self.cityName                      = name
    }
    
}
