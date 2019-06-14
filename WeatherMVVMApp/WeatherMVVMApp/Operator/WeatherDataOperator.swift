//
//  WeatherDataOperator.swift
//  WeatherMVVMApp
//
//  Created by param on 6/13/19.
//  Copyright © 2019 param. All rights reserved.
//

import Foundation

class WeatherDataOperator: Operator {
    
    var cityInfo: CityInfo
    
    init(info: CityInfo) {
        self.cityInfo = info
    }
    
    public func getRoute() -> Router {
        return Router.getWeatherData(info:self.cityInfo)
    }
}
