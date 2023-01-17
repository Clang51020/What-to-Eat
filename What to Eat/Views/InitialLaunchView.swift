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
    @EnvironmentObject var analytics: FirebaseAnalyticsMaster
    
    var body: some View {
        SplashScreen
        .padding()
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
}

struct InitialLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        InitialLaunchView()
    }
}
