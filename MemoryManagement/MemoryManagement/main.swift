//
//  main.swift
//  MemoryManagement
//
//  Created by jyotishankar sahoo on 14/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

var jack : Person? = Person(name: "Jack")
var bob : Person? = Person(name : "Bob")
print("Created \(jack!)")
print("Created \(bob!)")

var laptop : Asset? = Asset(name: "Laptop", value: 33000)

var hat : Asset? = Asset(name: "Hat", value: 2000)

var backPack : Asset? = Asset(name: "Back Pack", value: 3000)

jack?.takeOwnerShipOfAsset(laptop!)
jack?.takeOwnerShipOfAsset(hat!)
jack?.giveupOwnership(laptop!)

bob?.takeOwnerShipOfAsset(laptop!)

print("While Jack is alive the hat's ownr is \(jack)")
jack = nil
print("Now value of jack is \(jack)")
print("After Jack is Deallocated hat's owner is \(jack)")
laptop = nil
hat = nil
backPack = nil

