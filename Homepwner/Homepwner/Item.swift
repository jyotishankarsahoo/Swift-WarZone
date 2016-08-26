//
//  Item.swift
//  Homepwner
//
//  Created by jyotishankar sahoo on 09/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

class Item: NSObject {
    var name : String
    var valueInDollar : Double
    var serialNumber : String?
    let dateCreated : NSDate
    
    init(name : String, valueInDollar : Double, serialNumber : String?) {
        self.name = name
        self.valueInDollar = valueInDollar
        self.serialNumber = serialNumber
        dateCreated = NSDate()
        super.init()
    }
    
    convenience init(random : Bool = false) {
        if random {
            let adjectives = ["Fluffy","Rusrty","Shiny" ]
            let nouns = ["Bear","Spork","Mac"]
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjectives =  adjectives[Int(idx)]
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            let randomName = "\(randomAdjectives)\(randomNoun)"
            let randomValue = Double(arc4random_uniform(100))
            let randomSerialNumber = NSUUID().UUIDString.componentsSeparatedByString("-").first
            self.init(name : randomName , valueInDollar: randomValue , serialNumber : randomSerialNumber)
            
        }else{
            self.init(name : "" , valueInDollar: 0 , serialNumber: nil)
        }
    }
}