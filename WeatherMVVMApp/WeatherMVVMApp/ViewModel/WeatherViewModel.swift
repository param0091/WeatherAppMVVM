//
//  WeatherViewModel.swift
//  WeatherMVVMApp
//
//  Created by param on 6/13/19.
//  Copyright © 2019 param. All rights reserved.
//

import Foundation

import UIKit

typealias completionFetchCityWeather =  (_ result:WeatherInfo) -> Void

class WeatherViewModel: NSObject,NetworkProvider {
    
    let mapper          =   WeatherDataMapper()
    
    func getWeatherDataForCity(cityInfo: CityInfo, completionHandler: @escaping completionFetchCityWeather){
        
        let dataOperator = WeatherDataOperator(info: cityInfo)
        
        self.request(router: dataOperator.getRoute()) { (parsedData) in
            
            self.mapper.map(jsonData: parsedData, completionHandler: { weatherInfo in
                
                completionHandler(weatherInfo)
                
            })
        }
    }
    
}
