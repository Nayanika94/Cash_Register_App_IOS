//
//  ItemHistoryViewController.swift
//  Assignment2
//
//  Created by user202404 on 10/26/21.
//

import UIKit

class ItemHistoryViewController: UIViewController {
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemQuantity: UILabel!
    
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    
    var history : History?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemName.text = history?.itemName
        itemQuantity.text = String(history!.itemOuantity)
        totalPrice.text = "Total Amount: " + String(history!.totalPrice)
        date.text = history?.purchaseDate
        self.title = history?.itemName
    }

}

