//
//  NestApi.swift
//  NestApiModel
//
//  Created by Philipp Maluta on 28.10.17.
//  Copyright © 2017 com.ensoreus. All rights reserved.
//

import UIKit

struct Thermostat {
    var name : String? = ""
    var name_long : String? = ""
    var where_id : String? = ""
    var is_online: Bool? = false
}

class NestApi: NSObject {
    func getThermoStat(name:String!) -> Thermostat {
        return Thermostat()
    }
}
