//
//  Mapper.swift
//  WeatherMVVMApp
//
//  Created by param on 6/13/19.
//  Copyright © 2019 param. All rights reserved.
//

import Foundation

protocol Mapper {
    
    func map(jsonData: AnyObject, completionHandler: @escaping (_ success:WeatherInfo) -> Void)
}
