//
//  ItemStore.swift
//  Shopping List
//
//  Created by Jacob O'Quinn on 5/19/20.
//  Copyright © 2020 Jacob Oquinn. All rights reserved.
//
//  The file also has the data store for the items array
//  As well as some functionality
//  This items array will eventually be replaced with a database


import Foundation

class ItemStore {
    
    // one array for purchased the other for not purchased
    var items = [[Item](), [Item]()]
    
    
    // Add item
    func add(_ item: Item, at index: Int, purchased: Bool) {
        
        // Is the item purchased?
        let section = purchased ? 1 : 0
        
        // Insert task to the proper section
        items[section].insert(item, at: index)
    }
    
    // Remove item
    // We don't need to always get a Item back
    @discardableResult func remove(at index: Int, isPurchased: Bool = false) -> Item {
        
        // Is the item purchased?
        let section = isPurchased ? 1 : 0
        
        // remove the item from the array while also returning it
        // so that we can add it to the other section
        return items[section].remove(at: index)
    }
}
