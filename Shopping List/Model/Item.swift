//
//  item.swift
//  Shopping List
//
//  Created by Jacob O'Quinn on 3/25/20.
//  Copyright © 2020 Jacob Oquinn. All rights reserved.
//
//  This file contains the class item



import Foundation
import UIKit

class Item {
    
    // Properties of an item
    var purchased: Bool
    var name: String
    var quantity: Int
    var image: UIImage
    
    // The initialization function for an item
    init(purchased: Bool, name: String, quantity: Int, image: UIImage){
        self.purchased = purchased
        self.name = name
        self.quantity = quantity
        self.image = image
    }
}


