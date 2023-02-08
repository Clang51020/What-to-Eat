//
//  SignUpView.swift
//  What to Eat
//
//  Created by Chris Lang on 2/7/23.
//

import SwiftUI

struct SignUpView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password1: String = ""
    @State var password2: String = ""
    @Binding var signUpShown: Bool
    @State var alertText: String = ""
    @State var alertShown: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                headerSection
                CustomInputView(image: "", placeholderText: "First Name", text: $firstName).padding(.horizontal)
                CustomInputView(image: "", placeholderText: "Last Name", text: $lastName).padding(.horizontal)
                CustomInputView(image: "envelope", placeholderText: "Email", text: $email).padding(.horizontal)
                CustomInputView(image: "lock", placeholderText: "Password", text: $password1).padding(.horizontal)
                CustomInputView(image: "lock", placeholderText: "Confirm Your Password", text: $password2).padding(.horizontal)
                buttonSection
                Spacer()
            }
            .alert(isPresented: $alertShown) {
                Alert(title: Text("Error Creating Account"), message: Text(alertText), dismissButton: .default(Text("Dismiss")))
            }
        }
    }
}

extension SignUpView {
    var headerSection: some View {
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
    }
    
    var buttonSection: some View {
        VStack {
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
                    signUpShown = false
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
            Button {
                signUpShown = false
            } label: {
                Text("Cancel")
                    .foregroundColor(.brandPurple)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(signUpShown: .constant(true))
    }
}
