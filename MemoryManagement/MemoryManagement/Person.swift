//
//  Person.swift
//  MemoryManagement
//
//  Created by jyotishankar sahoo on 14/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name : String
    let accountant : Accountant = Accountant()
    var assets = [Asset]()
    
    var description: String{
        return "\(name)"
    }
    
    init(name : String){
        self.name = name
        accountant.netWorthChangeHandler = {
            [weak self] netWorth in self?.netWorthDidChange(netWorth)
            return
        }
    }
    deinit{
        print("\(name) is deallocated")
    }
    
    func takeOwnerShipOfAsset(asset : Asset)  {
        //Silver Challenge
        guard (asset.owner == nil) else{
            print("The OwnerShip is already assigned ")
            return
        }
        asset.owner = self
        assets.append(asset)
        accountant.gainedNewAsset(asset)
    }
    // Bronze Challenge
    func giveupOwnership(asset : Asset)  {
        asset.owner = nil
        let index = assets.indexOf({$0 === asset})
        assets.removeAtIndex(index!)
        accountant.giveUpAsset(asset)
    }
    func netWorthDidChange(netWorth : Double){
        print("the net worth of \(self) is \(netWorth)")
    }
}