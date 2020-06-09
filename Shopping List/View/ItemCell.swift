//
//  ItemCell.swift
//  Shopping List
//
//  Created by Jacob O'Quinn on 3/25/20.
//  Copyright © 2020 Jacob Oquinn. All rights reserved.
//
//  This file is the functionality for the itemCell.xib file
//


import UIKit

class ItemCell: UITableViewCell {


    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
