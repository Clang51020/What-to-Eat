//
//  What_to_EatApp.swift
//  What to Eat
//
//  Created by Chris Lang on 1/1/23.
//

import Firebase
import MailchimpSDK
import SwiftUI

@main
struct What_to_EatApp: App {
    
    @StateObject var fbMaster = FirebaseMaster()
    
    init() {
        FirebaseApp.configure()
        try? Mailchimp.initialize(token: "5fd70b88c0e97f59f66afc2878f4c033-us14", autoTagContacts: true, debugMode: false)
    }
    
    var body: some Scene {
        WindowGroup {
            InitialLaunchView()
                .environmentObject(fbMaster)
        }
    }
}
