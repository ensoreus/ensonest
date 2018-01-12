//
//  NestApi.swift
//  NestApiModel
//
//  Created by Philipp Maluta on 28.10.17.
//  Copyright © 2017 com.ensoreus. All rights reserved.
//

import UIKit
import Alamofire

open class NestApi: NSObject {
    private let baseUrl = "https://developer-api.nest.com"
    private let auth = NestAuth()
    
    public struct Camera{
        
    }
    
    public func authorize(withViewController:UIViewController?, authorized: @escaping ((Bool)->Void)){
            self.authorize(authorized:authorized)
    }
    
    public func authorize(authorized:@escaping ((Bool)->Void)) -> Void{
        auth.postAuth(onSuccess: {() in
            authorized(true)
        }) { (error:String) in
            authorized(false)
        }
    }
    
    public func fetchStructure(fetched: @escaping ((HomeEquipment)->Void)){
        
    }
    
    public func subscribeForCamNotifications(){
        
    }

}
