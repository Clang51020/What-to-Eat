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
    @State var isBack: Bool = false
    
    var body: some View {
        
        switch onboardingStep {
        case 0: WelcomeScreen.onAppear() { analytics.recordScreen(screen: "Welcome Screen - Onboarding")}
        case 1: SearchOverview.onAppear() { analytics.recordScreen(screen: "Search Overview - Onboarding")}
        case 2: LocationRequest.onAppear() { analytics.recordScreen(screen: "Location Request - Onboarding")}
        case 3: AddingPlaces.onAppear() { analytics.recordScreen(screen: "Adding Places - Onboarding")}
        case 4: RouletteResults.onAppear() { analytics.recordScreen(screen: "Roulette Results - Onboarding")}
        case 5: UserInfoAccountCreation.onAppear() { analytics.recordScreen(screen: "Initial User Creation - Onboarding")}
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
