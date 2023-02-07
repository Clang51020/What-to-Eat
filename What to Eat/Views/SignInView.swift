//
//  SignInView.swift
//  What to Eat
//
//  Created by Chris Lang on 2/6/23.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 40) {
                    headerInfo
                    CustomInputView(image: "envelope", placeholderText: "Email", text: $email).padding(.horizontal)
                    CustomInputView(image: "lock", placeholderText: "Password", text: $password).padding(.horizontal)
                    signInButton
                    Spacer()
                    footerInfo
                }
            }
        }
    }
}

extension SignInView {
    var headerInfo: some View {
        ZStack(alignment:.leading) {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .clipShape(RoundedShape(corners: [.bottomRight]))
                .foregroundColor(.brandPurple)
                .ignoresSafeArea()
            VStack(alignment:.leading) {
                Text("Let's Eat!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Sign in to get started")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }.padding(.leading)
                .padding(.bottom, 100)
        }
    }
    
    var signInButton: some View {
        Button {
            //Hold for loggin in
        } label: {
            Text("Sign In")
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.brandPurple)
                .cornerRadius(20)
                .padding(.horizontal)
                .foregroundColor(.white)
        }
    }
    
    var footerInfo: some View {
        VStack{
            NavigationLink {
                TabView()
                    .toolbar(.hidden)
            } label: {
                Text("Don't have an account? Sign Up")
                    .foregroundColor(.brandPurple)
            }
            NavigationLink {
                //Forgot password screen
            } label: {
                Text("Forgot your Password?")
                    .padding(.top,3)
                    .foregroundColor(.brandPurple)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
