//
//  Router.swift
//  WeatherMVVMApp
//
//  Created by param on 6/13/19.
//  Copyright © 2019 param. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - URLRequestConvertible

/**
 Types adopting the `URLRequestConvertible` protocol can be used to construct URL requests.
 */
public protocol URLRequestConvertible {
    /// The URL request.
    var urlRequest: URLRequest { get }
}

enum Router: URLRequestConvertible {
    
    static let baseUrl = Constant.AppKeyAndUrls.baseURL
    
    case getWeatherData(info:CityInfo)
    
    //Request Type
    var method: String {
        switch self {
            
        case .getWeatherData:
            return Alamofire.HTTPMethod.get.rawValue
        }
    }
    
    //?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22
    //Url Paths
    var path: String {
        switch self {
        case .getWeatherData(let info):
            return "id=\(info.cityId)&appid=\(Constant.AppKeyAndUrls.appKey.rawValue)"
        }
    }
    
    //Generate request
    public var urlRequest:URLRequest {
        
        let completeURLString = Router.baseUrl.rawValue + path
        let URLSTR = completeURLString.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: URLSTR!)
        var request = URLRequest(url: url!)
        request.httpMethod = method
        
        do{
            return try Alamofire.JSONEncoding.default.encode(request)
        }
        catch
        {
            print(error.localizedDescription)
        }
        return request
    }
}
