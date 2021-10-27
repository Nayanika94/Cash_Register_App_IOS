//
//  history.swift
//  Assignment2
//
//  Created by user202404 on 10/26/21.
//

import Foundation

class History
{
    var itemName : String
    var itemOuantity : Int
    var totalPrice: Double
    var purchaseDate: String
    
    init(name : String, quantity: Int, total: Double, date: String)
    {
        itemName = name
        itemOuantity = quantity
        totalPrice = total
        purchaseDate = date
    }
}
