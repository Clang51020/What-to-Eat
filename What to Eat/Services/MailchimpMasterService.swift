//
//  MailchimpMasterService.swift
//  What to Eat
//
//  Created by Chris Lang on 1/1/23.
//

import Foundation
import MailchimpSDK

class MailchimpMaster: ObservableObject {
    
    // MARK: Create a new subscriber from the onboarding screens of the application
    func onboardingSubscribeUser(email: String, firstName: String, lastName: String, status: String?) {
        var contact: Contact = Contact(emailAddress: email)
        contact.status = .subscribed
        let mergeFields = ["FNAME" : MergeFieldValue.string(firstName), "LNAME" : MergeFieldValue.string(lastName), "USERSTATUS" : MergeFieldValue.string(status ?? "")]
        contact.mergeFields = mergeFields
        contact.tags = [Contact.Tag(name: "Onboarding Subscription", status: .active)]
        Mailchimp.createOrUpdate(contact: contact)
    }
    // MARK: Create a new subscriber after onboarding
    func subscribeUser(email: String, firstName: String, lastName: String, status: String?) {
        var contact: Contact = Contact(emailAddress: email)
        contact.status = .subscribed
        let mergeFields = ["FNAME" : MergeFieldValue.string(firstName), "LNAME" : MergeFieldValue.string(lastName), "USERSTATUS" : MergeFieldValue.string(status ?? "")]
        contact.mergeFields = mergeFields
        contact.tags = [Contact.Tag(name: "After Onboarding Subscription", status: .active)]
        Mailchimp.createOrUpdate(contact: contact)
    }
}
