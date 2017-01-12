//
//  Item.swift
//  Homepwner
//
//  Created by jyotishankar sahoo on 09/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation


class Item: NSObject,NSCoding {
    var name : String
    var valueInDollar : Double
    var serialNumber : String?
    var dateCreated : NSDate
    let itemKey : String
    
     func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(serialNumber, forKey: "serialNumber")
        aCoder.encodeObject(itemKey, forKey: itemKey)
        aCoder.encodeDouble(valueInDollar, forKey: "valueInDollar")
        aCoder.encodeObject(dateCreated, forKey: "dateCreated")
    }
    
    required init?(coder aDecoder: NSCoder){
        name = aDecoder.decodeObjectForKey("name") as! String
        dateCreated = aDecoder.decodeObjectForKey("dateCreated") as! NSDate
        if let key = aDecoder.decodeObjectForKey("itemKey"){
            itemKey = key as! String
        }else{
            itemKey = "123"
        }
        serialNumber = aDecoder.decodeObjectForKey("serialNumber") as? String
        valueInDollar = aDecoder.decodeDoubleForKey("valueInDollar")
        super.init()
    }
    
    init(name : String, valueInDollar : Double, serialNumber : String?,dateCreated : NSDate) {
        self.name = name
        self.valueInDollar = valueInDollar
        self.serialNumber = serialNumber
        self.dateCreated = dateCreated
        itemKey = NSUUID().UUIDString
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
            self.init(name : randomName , valueInDollar: randomValue , serialNumber : randomSerialNumber , dateCreated: NSDate())
            
        }else{
            self.init(name : "" , valueInDollar: 0 , serialNumber: nil ,dateCreated: NSDate())
        }
    }
}