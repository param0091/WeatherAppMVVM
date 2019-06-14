//
//  Operator.swift
//  WeatherMVVMApp
//
//  Created by param on 6/13/19.
//  Copyright © 2019 param. All rights reserved.
//

import UIKit

protocol Operator {
    associatedtype P = NetworkProvider
    
    func getRoute() -> Router
}
