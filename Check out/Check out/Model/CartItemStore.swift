//
//  CartItemStore.swift
//  Check out
//
//  Created by Jacob O'Quinn on 5/24/20.
//  Copyright © 2020 Jacob Oquinn. All rights reserved.
//

import Foundation

class CartItemStore {
    
    var items = [CartItem]()
    
    // Add item, maybe have there be an option to add and array of CartItem's
    func add(_ CartItem: CartItem, at index: Int = 0) {
        
        // Insert CartItem to the proper index
        items.insert(CartItem, at: index)
    }
    
    // Remove item
    func remove(at index: Int){
        
        // Remove CartItem at proper index
        items.remove(at: index)
        
    }
    
}



