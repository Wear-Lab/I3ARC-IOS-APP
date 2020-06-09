//
//  ViewController.swift
//  Shopping List
//
//  Created by Jacob O'Quinn on 3/24/20.
//  Copyright © 2020 Jacob Oquinn. All rights reserved.
//
//  This file is the controller for the shoppinglist storyboard
//

import UIKit

class ShoppingListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ProfilePic: UIImageView!
    
    let itemStore = ItemStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialze itemStore
        // FIXME: - This should be replaced with something in app delegate that doesn't refresh it everytime the app starts
        // For now the app will reset the shopping list the user creates
        let itemsNotPurchased = [Item.init(purchased: false, name: "Lemon", quantity: 10, image: #imageLiteral(resourceName: "20fd77c03f1733d27bcc98e2e9160d43"))]
        let itemsPurchased = [Item.init(purchased: true, name: "Apple", quantity: 6, image: #imageLiteral(resourceName: "32620647371fb994a842757d3c1a8809"))]
        
        itemStore.items = [itemsNotPurchased, itemsPurchased]
        
        // Get data / delegate for the tableView
        tableView.dataSource = self
        tableView.delegate = self
        
        // Crop the profile picture to a circle
        ProfilePic.layer.cornerRadius = 50 //ProfilePic.frame.size.width / 2
        ProfilePic.clipsToBounds = true
        
        tableView.register(UINib(nibName: K.itemNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        
        // Setting up our alert controller
        let alertController = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        
        // Set up the actions
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            
            // Grab text field text
            guard let name = alertController.textFields?.first?.text else { return }
            
            // Create item
            let newItem = Item(purchased: false, name: name, quantity: 0, image: #imageLiteral(resourceName: "32620647371fb994a842757d3c1a8809"))
            
            // Add item
            self.itemStore.add(newItem, at: 0, purchased: newItem.purchased)
            
            // Reload data in table view
            // Set to 0 because we are adding to the first section
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        addAction.isEnabled = false // Add button can't be selected with empty string
        
        // Add the text field
        alertController.addTextField { textField in
            
            textField.placeholder = "Enter Item's name..."
            textField.addTarget(self, action: #selector(self.handleTextChanged), for: .editingChanged)
        }
        
        // Add the actions
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        // Present
        present(alertController, animated: true)
    }
    
    @objc private func handleTextChanged(_ sender: UITextField){
        
        // Grab the alert controller and add action
        guard let alertController = presentedViewController as? UIAlertController,
              let addAction = alertController.actions.first,
              let text = sender.text
              else { return }
        
        // Enabled add action based on if text is empty or contains whiteSpace
        addAction.isEnabled = !text.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
}

// MARK: - DataSource
extension ShoppingListViewController: UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? K.notPurchasedHeader : K.purchasedHeader
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return itemStore.items.count
    }
    
    // Check how many items we have in the section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.items[section].count
    }
    
    // Put cells into the tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Temp cell
        let cell = Bundle.main.loadNibNamed(K.itemNibName, owner: self, options: nil)?.first as! ItemCell
        
        // Assign values from items[indexpath] to the temp cell we return
        cell.itemImage.image = itemStore.items[indexPath.section][indexPath.row].image
        cell.itemName.text = itemStore.items[indexPath.section][indexPath.row].name
        cell.itemQuantity.text = "\(itemStore.items[indexPath.section][indexPath.row].quantity)"
        
        // Return the cell we made 
        return cell
    
    }
}

// MARK: - Delegate
extension ShoppingListViewController: UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    // Delete item action
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, sourceView, completionHandler)  in
            
            // Determine whether the item is purchased
            let isPurchased = self.itemStore.items[indexPath.section][indexPath.row].purchased
            
            // Remove the task from the appropriate array
            self.itemStore.remove(at: indexPath.row, isPurchased: isPurchased)
            
            // Reload table view
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // Indicate that the action was preformed
            completionHandler(true)
        }
        
        // Styles for the action
        deleteAction.image = #imageLiteral(resourceName: "delete")
        deleteAction.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.137254902, blue: 0.1677644392, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // Mark item as purchased action
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let purchasedAction = UIContextualAction(style: .normal, title: nil) { ( action, sourceView, completionHandler) in
            
            // Toggle that item is purchased
            self.itemStore.items[indexPath.section][indexPath.row].purchased = !self.itemStore.items[indexPath.section][indexPath.row].purchased
            
            // Remove the item form the array containing purchased items
            // We return an item to temp item so we can then readd it to the appropriate array
            let tempItem = self.itemStore.remove(at: indexPath.row)
            
            // Reload table view
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // Add the item from the array containing purchased items
            self.itemStore.add(tempItem, at: 0, purchased: tempItem.purchased)
            
            // Reload tableView
            let sectionNum = tempItem.purchased ? 1 : 0
            tableView.insertRows(at: [IndexPath(row: 0, section: sectionNum)], with: .automatic)
            
            // Indicate the action was preformed
            completionHandler(true)
            
        }
        
        // Styles for the action
        purchasedAction.image = #imageLiteral(resourceName: "purchase")
        purchasedAction.backgroundColor = #colorLiteral(red: 0.0226826112, green: 0.7208708781, blue: 0.3115533934, alpha: 1)
        
        // If we are in the "Not purchased" section we can mark items as purchased
        return indexPath.section == 0 ? UISwipeActionsConfiguration(actions: [purchasedAction]) : nil
    }
    
}
