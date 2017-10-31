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
import SafariServices

class NestAuth: NSObject {
    private let baseUrl = "https://developer-api.nest.com"
    private var viewcontroller : UIViewController?
    private var authViewController : AuthWebViewController?
    
    private let oauth = OAuth2Swift(
        consumerKey:    "f2a47dec-fb5d-4dad-8370-97a915ab3eb8",
        consumerSecret: "E41BTWHWMYt3q5N9yb3klATuT",
        authorizeUrl:   "https://api.home.nest.com/oauth2/access_token", //"https://home.nest.com/login/oauth2?client_id=f2a47dec-fb5d-4dad-8370-97a915ab3eb8&state=STATE",
        responseType:   "token"
    )
    
    private let sessionManager = SessionManager.default
    override init() {
        sessionManager.retrier = oauth.requestAdapter
    }
    
    public func getPin(viewController: UIViewController?, gotPin:@escaping ((String)->Void)){
        authViewController = AuthWebViewController()
        authViewController?.gotPin = gotPin
        let nv = viewController as! UINavigationController!
        nv?.pushViewController(authViewController!, animated: true);
    }
    
//    public func authorize() -> Bool{
//        oauthswift.client.get("https://api.linkedin.com/v1/people/~",
//                              success: { response in
//                                let dataString = response.string
//                                print(dataString)
//        },
//                              failure: { error in
//                                print(error)
//        }
//        )
//        return true
//    }
    
    func postAuth(pin: String, onSuccess:@escaping ()->Void,
                  onFailure:@escaping (_:String)->Void )
    {
//        let _ = oauth.authorize(
//            withCallbackURL: URL(string: "oauth-swift://oauth-callback/nest")!,
//            scope: "thermostat", state:"Nest",
//            success:{(credentials:OAuthSwiftCredential,
//                    response:OAuthSwiftResponse?,
//                    params:OAuthSwift.Parameters) in
//                onSuccess()
//        },
//            failure:{(error:OAuthSwiftError) in
//                onFailure(error.description)
//        })
        
        oauth.authorize(deviceToken:pin,
                        grantType:"authorization",
                        success: {(credentials:OAuthSwiftCredential) in
                            onSuccess()
        }, failure: {(error:OAuthSwiftError) in
            onFailure(error.description)
        })
        
    }
}
