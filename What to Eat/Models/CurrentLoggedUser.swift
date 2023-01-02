//
//  CurrentUser.swift
//  What to Eat
//
//  Created by Chris Lang on 1/2/23.
//

import Foundation

struct CurrentLoggedUser: Identifiable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var profileUrl: String?
}
