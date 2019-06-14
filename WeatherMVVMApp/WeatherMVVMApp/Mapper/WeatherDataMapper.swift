//
//  WeatherDataMapper.swift
//  WeatherMVVMApp
//
//  Created by param on 6/13/19.
//  Copyright © 2019 param. All rights reserved.
//

import Foundation

class WeatherDataMapper: Mapper {
    
    func map(jsonData: AnyObject, completionHandler: @escaping (_ success:WeatherInfo) -> Void){
        
        guard let response = jsonData as? [String:Any] else { return }
        
        if response["cod"] as? Int == 200{
            
            
            guard let temperatureInfo = response["main"] as? [String:Any] else { return }
            guard let temprature = temperatureInfo["temp"] else { return }
            guard let windInfo = response["wind"] as? [String:Any] else { return }
            guard let windSpeed = windInfo["speed"] else { return }
            guard let weatherInfo = response["weather"] as? [[String:Any]] else { return }
            guard let weatherIcon = weatherInfo.first?["icon"] else { return }
            
            let weatherInfoModel = WeatherInfo(temperature:"\(temprature)", weatherIconName: weatherIcon as! String, windSpeed: "\(windSpeed)", name: response["name"] as! String)
            completionHandler(weatherInfoModel)
            
        }
    }
}
