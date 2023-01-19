//
//  ContentView.swift
//  What to Eat
//
//  Created by Chris Lang on 1/1/23.
//

import Firebase
import FirebaseAnalytics
import SwiftUI

struct InitialLaunchView: View {
    @EnvironmentObject var fbMaster: FirebaseMaster
    @ObservedObject var analytics = FirebaseAnalyticsMaster.shared
    @AppStorage("onboardingStep") var onboardingStep: Int = 0
    
    var body: some View {
        
        switch onboardingStep {
        case 0: WelcomeScreen
        case 1: SplashScreen
        case 2: SplashScreen
        case 3: SplashScreen
        case 4: SplashScreen
        case 5: SplashScreen
        default: SplashScreen
        }
    }
}

extension InitialLaunchView {
    var SplashScreen: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
    
    var WelcomeScreen: some View {
        VStack {
            Image(systemName: "house")
            Text("Welcome Screen")
        }
    }
}

struct InitialLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        InitialLaunchView()
    }
}
