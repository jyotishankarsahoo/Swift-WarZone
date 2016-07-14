//
//  Asset.swift
//  MemoryManagement
//
//  Created by jyotishankar sahoo on 14/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

class Asset: CustomStringConvertible {
    let name : String
    let value : Double
    //Created Weak reference tio avoid strong reference cycle
    weak var owner : Person?
    
    var description: String{
        if  let actualOwner = owner{
            return "Asset named \(name) is worth \(value) owned by \(actualOwner)"
        }else{
            return "Asset named \(name) is worth \(value)"
        }
   }
    
    init(name : String ,  value : Double){
        self.name = name
        self.value = value
    }
    
    deinit{
        print("asset \(name) worth \(value) is deallocated")
    }
}