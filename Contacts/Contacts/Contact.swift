//
//  Contact.swift
//  Contacts
//
//  Created by jyotishankar sahoo on 27/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

class Contact: NSObject {
    var firstName : String
    var lastName : String
    var fullName : String{
        return firstName + lastName
    }
    init(firstName : String , lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}