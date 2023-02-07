//
//  ContentView.swift
//  What to Eat
//
//  Created by Chris Lang on 1/1/23.
//

import Firebase
import FirebaseAnalytics
import SwiftUI
import CoreLocation

struct InitialLaunchView: View {
    @EnvironmentObject var fbMaster: FirebaseMaster
    @ObservedObject var analytics = FirebaseAnalyticsMaster.shared
    @AppStorage("onboardingStep") var onboardingStep: Int = 2
    @ObservedObject var locationManager = LocationManager.shared
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password1: String = ""
    @State var password2: String = ""
    @State var alertShowing: Bool = false
    
    var body: some View {
        
        switch onboardingStep {
        case 0: WelcomeScreen.onAppear() { analytics.recordScreen(screen: "Welcome Screen - Onboarding")}
        case 1: SearchOverview.onAppear() { analytics.recordScreen(screen: "Search Overview - Onboarding")}
        case 2: LocationRequest.onAppear() { analytics.recordScreen(screen: "Location Request - Onboarding")}
        case 3: AddingPlaces.onAppear() { analytics.recordScreen(screen: "Adding Places - Onboarding")}
        case 4: RouletteResults.onAppear() { analytics.recordScreen(screen: "Roulette Results - Onboarding")}
        case 5: UserInfoAccountCreation.onAppear() { analytics.recordScreen(screen: "Initial User Creation - Onboarding")}
        case 6: TabView().onAppear() { analytics.recordScreen(screen: "Tab View")}
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
        ZStack {
            Color.secondaryColor.ignoresSafeArea()
            VStack() {
                Spacer()
                Image("LocationSearch")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .scaledToFit()
                    .padding(.bottom,32)
                Text("Would you like to search for places nearby?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Spacer()
                Button {
                    locationManager.checkIfLocationServicesEnabled()
                    if locationManager.userLocation != nil {
                        onboardingStep += 1
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .foregroundColor(.primaryColor)
                        Text("Allow Location Access")
                            .foregroundColor(.white)
                    }
                }

                Button {
                    onboardingStep += 1
                } label: {
                    Text("Maybe later")
                }.padding(.bottom)

            }.foregroundColor(.brandPurple)
                .onAppear() {
                    locationManager.checkIfLocationServicesEnabled()
                }
        }
    }
    
    var AddingPlaces: some View {
        VStack {
            Image(systemName: "house")
            Text("Adding Places to Lists")
            Button {
                onboardingStep -= 1
            } label: {
                Text("Go Back")
            }

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
            Text("User Information Account Creating Screens")
                .padding(.vertical)
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
            TextField("Email Address", text: $email)
            SecureField("Password One", text: $password1)
            SecureField("Password Two", text: $password2)
            Button {
                if password1 == password2 {
                    
                } else {
                    alertShowing = true
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .foregroundColor(.primaryColor)
                    Text("Create Account")
                        .foregroundColor(.brandPurple)
                }
            }.alert(isPresented: $alertShowing) {
                Alert(title: Text("Passwords Do Not Match"), message: Text("The passwords you entered do not match. Please return and make sure your passwords match."), dismissButton: .default(Text("Return to Form")))
            }

        }.padding()
    }
}

struct InitialLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        InitialLaunchView()
    }
}
