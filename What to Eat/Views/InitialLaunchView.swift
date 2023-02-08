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
    @ObservedObject var fbMaster = FirebaseMaster.shared
    @ObservedObject var analytics = FirebaseAnalyticsMaster.shared
    @AppStorage("onboardingStep") var onboardingStep: Int = 6
    @ObservedObject var locationManager = LocationManager.shared
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password1: String = ""
    @State var password2: String = ""
    @State var alertShown: Bool = false
    @State var alertText: String = ""
    
    var body: some View {
        
        switch onboardingStep {
        case 0: WelcomeScreen.onAppear() { analytics.recordScreen(screen: "Welcome Screen - Onboarding")}
        case 1: SearchOverview.onAppear() { analytics.recordScreen(screen: "Search Overview - Onboarding")}
        case 2: LocationRequest.onAppear() { analytics.recordScreen(screen: "Location Request - Onboarding")}
        case 3: AddingPlaces.onAppear() { analytics.recordScreen(screen: "Adding Places - Onboarding")}
        case 4: RouletteResults.onAppear() { analytics.recordScreen(screen: "Roulette Results - Onboarding")}
        case 5: UserInfoAccountCreation.onAppear() { analytics.recordScreen(screen: "Initial User Creation - Onboarding")}
        case 6: StateCheckView().onAppear { fbMaster.checkCurrentUser() }
        default: StateCheckView()
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
            Color.white.ignoresSafeArea()
            VStack() {
                Spacer()
                ZStack {
                    Circle().foregroundColor(.primaryColor).offset(x:-200, y:-300)
                    Circle().foregroundColor(.secondaryColor).offset(x:100, y:-170).frame(width: 100, height: 100).opacity(0.7)
                    Circle().foregroundColor(.teriaryColor).offset(x:-175, y:100)
                        .frame(width: 200, height: 200)
                        .opacity(0.9)
                    Image("LocationSearch")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .scaledToFit()
                        .padding(.bottom,32)
                }
                Text("Would you like to search for places nearby?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
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
                            .foregroundColor(.brandPurple)
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
        VStack(spacing:30) {
            ZStack(alignment:.leading) {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .clipShape(RoundedShape(corners: [.bottomRight]))
                    .foregroundColor(.brandPurple)
                    .ignoresSafeArea()
                VStack(alignment:.leading) {
                    Text("Let's Get Started!")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text("Create your account")
                        .font(.title)
                        .foregroundColor(.white)
                }.padding(.leading)
                    .padding(.bottom, 100)
            }
            CustomInputView(image: "", placeholderText: "First Name", text: $firstName).padding(.horizontal)
            CustomInputView(image: "", placeholderText: "Last Name", text: $lastName).padding(.horizontal)
            CustomInputView(image: "envelope", placeholderText: "Email", text: $email).padding(.horizontal)
            CustomInputView(image: "lock", placeholderText: "Password", text: $password1).padding(.horizontal)
            CustomInputView(image: "lock", placeholderText: "Confirm Your Password", text: $password2).padding(.horizontal)
            Button {
                if firstName == "" {
                    alertText = "Please make sure you fill out the form completely"
                    alertShown = true
                } else if lastName == "" {
                    alertText = "Please make sure you fill out the form completely"
                    alertShown = true
                } else if email == "" {
                    alertText = "Please make sure you fill out the form completely"
                    alertShown = true
                } else if password1 != password2 {
                    alertText = "Passwords don't match."
                    alertShown = true
                } else {
                    // hold for creating new user
                    firstName = ""
                    lastName = ""
                    email = ""
                    password1 = ""
                    password2 = ""
                }
            } label: {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brandPurple)
                    .cornerRadius(20)
                    .padding()
                    .foregroundColor(.white)
            }
            Spacer()
        }.alert(isPresented: $alertShown) {
            Alert(title: Text("Error Creating Account"), message: Text(alertText), dismissButton: .default(Text("Dismiss")))
        }
    }
}

struct InitialLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        InitialLaunchView()
    }
}
