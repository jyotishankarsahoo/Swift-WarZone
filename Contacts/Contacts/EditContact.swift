//
//  EditContact.swift
//  Contacts
//
//  Created by jyotishankar sahoo on 28/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

@objc protocol EditContact : class{
    func populateContactInfo(firstName : String,lastName : String)
}