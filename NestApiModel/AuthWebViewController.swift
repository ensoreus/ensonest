//
//  AuthWebViewController.swift
//  EnsoNest
//
//  Created by Philipp Maluta on 30.10.17.
//  Copyright © 2017 com.ensoreus. All rights reserved.
//

import UIKit

class AuthWebViewController: UIViewController, UIWebViewDelegate {
    var webView : UIWebView?
    var pinViewController : PinViewController?
    var gotPin : ((String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = UIWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        webView?.delegate = self
        self.view.addSubview(webView!)
        let bundle = Bundle(for: type(of: self))
        pinViewController = PinViewController(nibName: "PinViewController", bundle: bundle)
        guard gotPin != nil else {
            return
        }
        pinViewController?.gotPin = gotPin
        webView?.loadRequest(URLRequest(url:URL(string: "https://home.nest.com/login/oauth2?client_id=f2a47dec-fb5d-4dad-8370-97a915ab3eb8&state=STATE")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    func webViewDidFinishLoad(_:UIWebView){
        let btnBarNext = UIBarButtonItem.init(title: "Enter PIN", style: .plain, target: self, action: #selector(showPinField))
        self.navigationItem.rightBarButtonItem = btnBarNext
    }
    
    @objc func showPinField(){
        self.navigationController?.pushViewController(pinViewController!, animated: true)
    }
    
    /*
    // MARK: - Navigation

     // In a storyboard-based application, youletll often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
