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
    
}