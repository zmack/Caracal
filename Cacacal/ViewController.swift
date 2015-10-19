//
//  ViewController.swift
//  Cacacal
//
//  Created by Andrei Bocan on 10/17/15.
//  Copyright © 2015 Andrei Bocan. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        if WCSession.isSupported() {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        NSLog("Hello from controller")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        NSLog("Just got a message \(message)")
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        NSLog("Got a thing \(message)")
    }
    func session(session: WCSession, didReceiveUserInfo userInfo: [String : AnyObject]) {
        NSLog("Got user info \(userInfo)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

