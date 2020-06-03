//
//  Item.swift
//  Check out
//
//  Created by Jacob O'Quinn on 5/24/20.
//  Copyright © 2020 Jacob Oquinn. All rights reserved.
//
//  Fields and initilizer for a CheckOutItem

import Foundation
import UIKit

class CartItem {
    
    // Data types for the item
    var image: UIImage
    var name: String
    var priceInCentsPerUnit: Int
    var quantity: Int
    
    // Initializer
    init(image: UIImage, name: String, priceInCentsPerUnit: Int, quantity: Int){
        self.image = image
        self.name = name
        self.priceInCentsPerUnit = priceInCentsPerUnit
        self.quantity = quantity
    }
}
