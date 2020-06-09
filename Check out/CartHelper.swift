//
//  CartHelper.swift
//  Check out
//
//  Created by Jacob O'Quinn on 5/26/20.
//  Copyright © 2020 Jacob Oquinn. All rights reserved.
//
//  Contains help functions used in the cart page
//

import Foundation


class CartHelper {
    
    
    // Used to convert item prices to text for labels
    static func formatCents(_ costInCents: Int) -> String {
        
        var ret = "$" + "\(costInCents / 100)" + "." + "\(costInCents % 100)"
        
        // Always have two trailing digits after "."
        if (costInCents % 100 < 10) {
            ret += "0"
        }
        return ret
    }
    
    // Gets total cost of all items in the CartItemStore
    static func totalCost(in cart: CartItemStore) -> String {
        
        var total = 0
        for item in cart.items {
            total += item.priceInCentsPerUnit * item.quantity
        }
        
        return formatCents(total)
    }
    
    
}
