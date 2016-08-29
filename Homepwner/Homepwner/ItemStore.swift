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
    
    func createItem() -> Item {
        let newItem = Item(random : true)
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(item : Item)  {
        if let index = allItems.indexOf(item){
            allItems.removeAtIndex(index)
        }
    }
    
    func moveItem(fromIndex : Int , toIndex : Int)  {
        if fromIndex == toIndex {
            return
        }
        let itemToBeMoved = allItems[fromIndex]
        allItems.removeAtIndex(fromIndex)
        allItems.insert(itemToBeMoved, atIndex: toIndex)
    }
}