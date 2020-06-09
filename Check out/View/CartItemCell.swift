//
//  CartItemCell.swift
//  Check out
//
//  Created by Jacob O'Quinn on 5/25/20.
//  Copyright © 2020 Jacob Oquinn. All rights reserved.
//

import UIKit
import Foundation

class CartItemCell: UITableViewCell {

    // Labels / Images
    @IBOutlet weak var Quantity: UILabel!
    @IBOutlet weak var PerUnit: UILabel!
    @IBOutlet weak var Total: UILabel!
    @IBOutlet weak var ItemName: UILabel!
    @IBOutlet weak var ItemImage: UIImageView!
    
    // Buttons
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var EditQuan: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    // closure methods
    var addButtonAction : (() -> ())?
    var subtractButtonAction : (() -> ())?
    var deleteButtonAction : (() -> ())?
    var editButtonAction : (() -> ())?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Add action to preform when the "+", "-" or Delete button is pressed
        self.addButton.addTarget(self, action: #selector(AddButtonPressed(_:)), for: .touchUpInside)
        self.subtractButton.addTarget(self, action: #selector(SubtractButtonPressed(_:)), for: .touchUpInside)
        self.deleteButton.addTarget(self, action: #selector(DeleteButtonPressed(_:)), for: .touchUpInside)
    }
    
    
    // Call corresponding closure method when a button is pressed
    @IBAction func AddButtonPressed(_ sender: UIButton) {
        addButtonAction?()
    }
    
    @IBAction func EditButtonAction(_ sender: UIButton) {
        editButtonAction?()
    }
    
    @IBAction func SubtractButtonPressed(_ sender: UIButton) {
        subtractButtonAction?()
    }
    
    @IBAction func DeleteButtonPressed(_ sender: UIButton) {
        deleteButtonAction?()
    }

}
