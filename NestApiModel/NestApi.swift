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
    public func getPin(withViewController:UIViewController?){
        auth.getPin(viewController: withViewController)
    }
    
    public func authorize(pin:String) -> Void{
        auth.postAuth(pin:pin, onSuccess: {() in
            print("success")
        }) { (error:String) in
            print(error)
        }
    }
    
    func getThermoStat(name:String!) -> Thermostat {
        return Thermostat()
    }
}
