//
//  CartViewController.swift
//  Check out
//
//  Created by Jacob O'Quinn on 4/7/20.
//  Copyright © 2020 Jacob Oquinn. All rights reserved.
//
//  The View Controller for the CheckOutScreen
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var TopBar: UIView!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var CartTableView: UITableView!
    @IBOutlet weak var ConfirmButton: UIButton!
    @IBOutlet weak var TotalLabel: UILabel!
    
    let cartItemStore = CartItemStore()
    
    // Total cost of items in cart
    var totalCost : Int = 0
    
    override func viewDidAppear(_ animated: Bool) {
        // Set navigation bar color
//        navigationController?.navigationBar.backgroundColor = UIColor.black
//        navigationController?.navigationBar.barTintColor = TopBar.backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        CartTableView.dataSource = self
        CartTableView.delegate = self
        
        // FIXME: - Replace this with a database
        let lemon = CartItem.init(image: #imageLiteral(resourceName: "20fd77c03f1733d27bcc98e2e9160d43"), name: "Lemon", priceInCentsPerUnit: 50, quantity: 3)
        let apple = CartItem.init(image: #imageLiteral(resourceName: "32620647371fb994a842757d3c1a8809"), name: "Apple", priceInCentsPerUnit: 132, quantity: 15)
        
        cartItemStore.add(lemon)
        cartItemStore.add(apple)
        
        // Get total cost of cart items
        TotalLabel.text = CartHelper.totalCost(in: cartItemStore)
        
        // Round out confirm order button
        ConfirmButton.layer.cornerRadius = ConfirmButton.frame.size.height / 2
        
        
    }
}



// MARK: - DataSource

extension CartViewController: UITableViewDataSource{
    
    // Number of items / cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        cartItemStore.items.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // The cell we are creating / returning
        let cell = Bundle.main.loadNibNamed(K.cartItemNibName, owner: self, options: nil)?.first as! CartItemCell
        
        // Temp values
        let perUnitInCents = cartItemStore.items[indexPath.row].priceInCentsPerUnit
        let quantity = cartItemStore.items[indexPath.row].quantity
        let itemTotalInCents = (perUnitInCents * quantity)
        
        // assign values to cell fields
        // Format Total / PerUnit as $XX.XX
        cell.Total.text =  CartHelper.formatCents(itemTotalInCents)
        cell.PerUnit.text = CartHelper.formatCents(perUnitInCents)
        cell.Quantity.text = "\(quantity)"
        cell.ItemName.text = cartItemStore.items[indexPath.row].name
        cell.ItemImage.image = cartItemStore.items[indexPath.row].image

        // Closures
        cell.addButtonAction = { [unowned self] in
            
            // Increment
            self.cartItemStore.items[indexPath.row].quantity += 1
            // Only need to reload one cell
            self.CartTableView.reloadRows(at: [indexPath], with: .none)
            // Reload overall total? Need to add some functions for this
            self.TotalLabel.text = CartHelper.totalCost(in: self.cartItemStore)
        }
        
        cell.subtractButtonAction = { [unowned self] in
            
            // Zero Check
            if (self.cartItemStore.items[indexPath.row].quantity > 0) {
                
                // Increment
                self.cartItemStore.items[indexPath.row].quantity -= 1
                // Only need to reload one cell
                self.CartTableView.reloadRows(at: [indexPath], with: .none)
                // Reload overall total? Need to add some functions for this
                self.TotalLabel.text = CartHelper.totalCost(in: self.cartItemStore)
            }
        }
        cell.deleteButtonAction = { [unowned self] in
            
            // Remove item from cartStore and TableView
            self.cartItemStore.remove(at: indexPath.row)
            self.CartTableView.deleteRows(at: [indexPath], with: .none)
            // TODO: This is a pretty choppy animation
            // It is also very inefficient
            self.CartTableView.reloadData()
            
            // Update Total
            self.TotalLabel.text = CartHelper.totalCost(in: self.cartItemStore)
        }
        
        
        return cell
    }
}


// MARK: - Delegate

extension CartViewController: UITableViewDelegate{
    
    // Height for cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
