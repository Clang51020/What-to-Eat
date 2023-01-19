//
//  FirebaseAnalyticsMaster.swift
//  What to Eat
//
//  Created by Chris Lang on 1/16/23.
//

import Firebase
import FirebaseAnalytics
import Foundation

class FirebaseAnalyticsMaster: ObservableObject {
    
    static let shared = FirebaseAnalyticsMaster()
    
    // MARK: Function to record a screenview
    func recordScreen(screen: String) {
        Analytics.logEvent(AnalyticsEventScreenView, parameters: [AnalyticsParameterScreenName: screen])
    }
}
