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
    var sortedItems = [Item]()
    
    init(){
        for _ in 0..<5 {
            self.createItem()
        }
        sortedItems = allItems.sort({ (x, y) -> Bool in
          return  x.valueInDollar < y.valueInDollar
        })
        
    }
    
    func createItem() -> Item {
        let newItem = Item(random : true)
        allItems.append(newItem)
        return newItem
    }
}