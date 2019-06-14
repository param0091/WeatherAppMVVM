//
//  Constant.swift
//  WeatherMVVMApp
//
//  Created by param on 6/13/19.
//  Copyright © 2019 param. All rights reserved.
//

import Foundation
import UIKit

public struct Constant{
    
    //https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22
    
   // public let baseURL = "https://samples.openweathermap.org/data/2.5/weather?"
    
   // public let appKey = "b6907d289e10d714a6e88b30761fae22"
    
    enum AppKeyAndUrls :String {
        case baseURL    = "https://api.openweathermap.org/data/2.5/weather?"
        case appKey     = "9ec26bd117c31eb6734390247aaf06aa"
        case imageUrl   = "http://openweathermap.org/img/w/"
    }
    
    enum CityIds: String{
        
        case London     = "2643743"
        case NewJersy   = "5101760"
        case Tokyo      = "1850147"
    }
    
    enum SegueId: String{
        
        case DetailVCSegue     = "DetailVCSegue"
        
    }
    
    
}
