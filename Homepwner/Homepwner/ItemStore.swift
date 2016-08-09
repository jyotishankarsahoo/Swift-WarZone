//
//  ItemStore.swift
//  Homepwner
//
//  Created by jyotishankar sahoo on 09/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

class ItemStore {
    
    var allItems = [Item]()
    
    init(){
        for _ in 0..<5 {
            self.createItem()
        }
    }
    
    func createItem() -> Item {
        let newItem = Item(name: "John", valueInDollar: 22, serialNumber: "123")
        allItems.append(newItem)
        return newItem
    }
}