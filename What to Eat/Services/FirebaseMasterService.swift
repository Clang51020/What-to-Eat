//
//  FirebaseMasterService.swift
//  What to Eat
//
//  Created by Chris Lang on 1/1/23.
//

import Firebase
import FirebaseStorage
import SwiftUI


class FirebaseMaster: ObservableObject {
    
    var auth: Auth
    var firestore: Firestore
    var storage: Storage
    @Published var currentSignedInUser: CurrentLoggedUser?
    @AppStorage("userSignedIn") var userSignedIn: Bool = false // stored value to persist login state for user when closing app
    
    init() {
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
        self.storage = Storage.storage()
    }
    // MARK: Creating a new user function
    func createNewUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error creating a new user: \(error.localizedDescription)")
                return
            }
            self.signInUser(email: email, password: password)
        }
    }
    // MARK: Sign User In Function
    func signInUser(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { resultUser, error in
            if let error = error {
                print("Error signing the user in: \(error.localizedDescription)")
                return
            }
            // if no error then set the user state to logged in
            self.userSignedIn = true
            self.getUserData(id: resultUser?.user.uid ?? "")
        }
    }
    // MARK: Function to get current signed in user's data
    func getUserData(id: String) {
        firestore.collection("users").document(id).getDocument { DocumentSnapshot, Error in
            if let Error = Error {
                print("Error getting user information: \(Error.localizedDescription)")
            }
            guard let data = DocumentSnapshot?.data() else {
                print("No data found for user ID : \(id)")
                return
            }
            let firstName = data["First Name"] as? String ?? "No First Name"
            let lastName = data["Last Name"] as? String ?? "No Last Name"
            let email = data["email"] as? String ?? "No Email Address"
            self.currentSignedInUser = CurrentLoggedUser(id: id, firstName: firstName, lastName: lastName, email: email)
        }
    }
    // MARK: Listener function for persisting firebase user logged in information when app closes and opens
    func checkCurrentUser() {
        auth.addStateDidChangeListener { Auth, User in
            if User != nil {
                guard let userID = self.auth.currentUser?.uid else { return }
                self.getUserData(id: userID)
                self.userSignedIn = true
            } else {
                self.userSignedIn = false
            }
        }
    }
    
}
