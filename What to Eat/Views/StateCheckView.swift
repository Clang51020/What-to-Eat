//
//  StateCheckView.swift
//  What to Eat
//
//  Created by Chris Lang on 2/7/23.
//

import SwiftUI

struct StateCheckView: View {
    @ObservedObject var fbMaster = FirebaseMaster.shared
    @ObservedObject var fbAnalytics = FirebaseAnalyticsMaster.shared
    var body: some View {
        if fbMaster.signedIn {
            TabView()
                .onAppear {
                    fbAnalytics.recordScreen(screen: "Tab View")
                }
        } else {
            SignInView()
        }
    }
}

struct StateCheckView_Previews: PreviewProvider {
    static var previews: some View {
        StateCheckView()
    }
}
