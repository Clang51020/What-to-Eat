//
//  What_to_EatApp.swift
//  What to Eat
//
//  Created by Chris Lang on 1/1/23.
//

import Firebase
import SwiftUI

@main
struct What_to_EatApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            InitialLaunchView()
        }
    }
}
