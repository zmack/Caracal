//
//  InterfaceController.swift
//  Cacacal WatchKit Extension
//
//  Created by Andrei Bocan on 10/17/15.
//  Copyright © 2015 Andrei Bocan. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    @IBOutlet var faceImage: WKInterfaceImage!
    @IBOutlet var faceLabel: WKInterfaceLabel!
    @IBOutlet var faceSwitch: WKInterfaceSwitch!

    @IBAction func tapped(value: Bool) {
        if value {
            faceImage.setImageNamed("omghappy")
        } else {
            faceImage.setImageNamed("aface")
        }
        NSLog("Tapped called with \(value)")
    }
    
    @IBAction func menuAccepted() {
        NSLog("Am dids accept")
        let message = ["Hello": "World"]
        WCSession.defaultSession().transferUserInfo(message)
    }
    
    @IBAction func menuBlocked() {
        NSLog("Dids accept for sure")
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        if WCSession.isSupported() {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        faceLabel.setText("I am have an active")
        
        faceImage.setImageNamed("omghappy")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
