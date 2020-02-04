//
//  DoSomething.swift
//  SwiftTestStaticLib
//
//  Created by Ashish Awasthi on 03/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation
public protocol LoginRequestDelegate: NSObjectProtocol {
    func loginRequest(_ loginRequest: LoginRequest, didLoginComplete isComplete: Bool)
}

public class LoginRequest {
    
    private var token: String = ""
    public weak var delegate: LoginRequestDelegate?
    public init() {
    }
    public func makeLoginRquest(userName: String, password: String) {
        FSLogInfo("Swift Statis Lib test UserName:-\(userName), Password:-\(password)")
        self.delegate?.loginRequest(self, didLoginComplete: true)
    }
    
    public func makeLoginRequest(complete: @escaping( _ isComplete: Bool)->Void) {
        FSLogInfo("Swift Statis Lib test clourse")
        complete(true)
    }
}
