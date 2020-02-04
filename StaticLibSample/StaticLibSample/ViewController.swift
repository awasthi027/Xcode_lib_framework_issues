//
//  ViewController.swift
//  StaticLibSample
//
//  Created by Ashish Awasthi on 03/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import UIKit
import SwiftTestStaticLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginRequest = LoginRequest()
        loginRequest.delegate = self
        loginRequest.makeLoginRequest { (isDone) in
            
        }
        loginRequest.makeLoginRquest(userName: "abhi027", password: "Abhi#123")
        // Do any additional setup after loading the view.
    }
}

extension ViewController: LoginRequestDelegate {
    
    func loginRequest(_ loginRequest: LoginRequest, didLoginComplete isComplete: Bool) {
        FSLogInfo("Call back from static lib")
    }

}
