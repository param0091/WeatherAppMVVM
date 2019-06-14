//
//  NetworkProvider.swift
//  WeatherMVVMApp
//
//  Created by param on 6/13/19.
//  Copyright © 2019 param. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkProvider {
    func request(router: Router, completionHandler: @escaping (_ success:AnyObject) -> Void)
}

extension NetworkProvider {
    public func request(router: Router,completionHandler: @escaping (_ success:AnyObject) -> Void)  {
        Alamofire.AF.request(router.urlRequest).validate().responseJSON { (response) in
            
            switch response.result {
            case .success:
                print("Validation Successful")
                
                if let value = response.value {
                    print(value)
                    completionHandler(value as AnyObject)
                }
                
            case .failure(let error):
                print(error)
                completionHandler(error as AnyObject)
            }
        }
    }
}
