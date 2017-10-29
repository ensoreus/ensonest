//
//  NestAuth.swift
//  NestApiModel
//
//  Created by Philipp Maluta on 28.10.17.
//  Copyright © 2017 com.ensoreus. All rights reserved.
//

import UIKit
import OAuthSwift
import Alamofire
import OAuthSwiftAlamofire

class NestAuth: NSObject {
    private let baseUrl = "https://developer-api.nest.com"
    private let oauth = OAuth2Swift(
        consumerKey:    "f2a47dec-fb5d-4dad-8370-97a915ab3eb8",
        consumerSecret: "E41BTWHWMYt3q5N9yb3klATuT",
        authorizeUrl:   "https://home.nest.com/login/oauth2?client_id=f2a47dec-fb5d-4dad-8370-97a915ab3eb8&state=STATE",
        responseType:   "token"
    )
    
    private let sessionManager = SessionManager.default
    override init() {
        sessionManager.retrier = oauth.requestAdapter
    }
    
    func get(request: String, success:()->Void, failure: ()->Void ){
        Alamofire.request(baseUrl + request).responseJSON { response in
            
        }
    }
}
