//
//  Accountant.swift
//  MemoryManagement
//
//  Created by jyotishankar sahoo on 14/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

class Accountant {
    typealias NetWorthChanged = (Double) -> ()
    var netWorthChangeHandler : NetWorthChanged? = nil
    var netWorth : Double = 0 {
        didSet{
             netWorthChangeHandler? (netWorth)
        }
    }
    
    func gainedNewAsset(asset : Asset){
        netWorth += asset.value
    }
    
    func giveUpAsset(asset :  Asset)  {
        netWorth -= asset.value
    }
}