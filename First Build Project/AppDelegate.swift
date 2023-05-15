//
//  AppDelegate.swift
//  First Build Project
//
//  Created by Theadultnoble on 12/05/2023.
//

import Foundation
import SwiftUI
import ParseSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("app launched!")
        ParseSwift.initialize(applicationId: "vX1U4hEup9N2py41A03l7BSqJg3KbB2BK1kFYFdY", clientKey: "lVPnA5lsUp48P2cNKvh2rIETexX2ZH2YwJ29NChP", serverURL: URL(string: "https://parseapi.back4app.com")!)

        return true
    }
    
}
