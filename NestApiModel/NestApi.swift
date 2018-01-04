//
//  NestApi.swift
//  NestApiModel
//
//  Created by Philipp Maluta on 28.10.17.
//  Copyright © 2017 com.ensoreus. All rights reserved.
//

import UIKit
import Alamofire

struct Thermostat {
    var name : String? = ""
    var name_long : String? = ""
    var where_id : String? = ""
    var is_online: Bool? = false
    func setTemperature(volume: Int) -> Bool {
        return true
    }
}

open class NestApi: NSObject {
    private let baseUrl = "https://developer-api.nest.com"
    private let auth = NestAuth()
    
    public func authorize(withViewController:UIViewController?, authorized: @escaping ((Bool)->Void)){
            self.authorize(authorized:authorized)
    }
    
//    private func getPin(withViewController:UIViewController?, gotPin: @escaping ((_:String)->Void)){
//        auth.getPin(viewController: withViewController, gotPin:gotPin)
//    }
    
    public func authorize(authorized:@escaping ((Bool)->Void)) -> Void{
        auth.postAuth(onSuccess: {() in
            authorized(true)
        }) { (error:String) in
            authorized(false)
        }
    }
    
    func getThermoStat(name:String!) -> Thermostat {
        return Thermostat()
    }
}
