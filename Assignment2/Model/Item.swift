//
//  item.swift
//  Assignment2
//
//  Created by user202404 on 10/26/21.
//

import Foundation

class Item
{
    var itemName : String
    var itemQuantity : Int
    var itemPrice: Float
    
    init(name : String, quantity: Int, price: Float)
    {
        itemName = name
        itemQuantity = quantity
        itemPrice = price
    }
}

