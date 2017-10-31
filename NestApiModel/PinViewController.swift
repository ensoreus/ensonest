//
//  PinViewController.swift
//  NestApiModel
//
//  Created by Philipp Maluta on 31.10.17.
//  Copyright © 2017 com.ensoreus. All rights reserved.
//

import UIKit

class PinViewController: UIViewController {
    var gotPin : ((String)->Void)?
    @IBOutlet weak var txPin: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onNext(_ sender: Any) {
        guard gotPin==nil else {
            gotPin!(txPin!.text!)
            return
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
