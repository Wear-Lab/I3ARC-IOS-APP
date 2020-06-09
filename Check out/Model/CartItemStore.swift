//
//  CartItemStore.swift
//  Check out
//
//  Created by Jacob O'Quinn on 5/24/20.
//  Copyright © 2020 Jacob Oquinn. All rights reserved.
//

import Foundation

class CartItemStore {
    
    // Where our items are stored
    var items = [CartItem]()
    
    // Add one item
    func add(_ cartItem: CartItem, at index: Int = 0) {
        
        // Insert CartItem to the proper index
        items.insert(cartItem, at: index)
    }
    // Add an array of CartItems
    func add(_ cartItems: [CartItem], at index: Int = 0){
        for item in cartItems{
            items.insert(item, at: index)
        }
    }
    
    // Remove item
    func remove(at index: Int){
        
        // Remove CartItem at proper index
        items.remove(at: index)
    }
    
}



