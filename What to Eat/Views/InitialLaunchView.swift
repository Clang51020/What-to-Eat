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
        case 1: SearchOverview
        case 2: LocationRequest
        case 3: AddingPlaces
        case 4: RouletteResults
        case 5: UserInfoAccountCreation
        case 6: SplashScreen // replace this with the TabView once that is created.
        default: WelcomeScreen
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
    
    var SearchOverview: some View {
        VStack {
            Image(systemName: "house")
            Text("Search Overview")
        }
    }
    
    var LocationRequest: some View {
        VStack {
            Image(systemName: "house")
            Text("Location Request View")
        }
    }
    
    var AddingPlaces: some View {
        VStack {
            Image(systemName: "house")
            Text("Adding Places to Lists")
        }
    }
    
    var RouletteResults: some View {
        VStack {
            Image(systemName: "house")
            Text("Results Request Overview")
        }
    }
    
    var UserInfoAccountCreation: some View {
        VStack {
            Image(systemName: "house")
            Text("User Information Account Creating Screens")
        }
    }
}

struct InitialLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        InitialLaunchView()
    }
}
