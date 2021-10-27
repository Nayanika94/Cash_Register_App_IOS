//
//  Manager.swift
//  Assignment2
//
//  Created by user202404 on 10/26/21.
//

import Foundation

class Manager {
    var items = [Item]()
    var histories = [History]()
    
    func addNewItems(newItem :Item)
    {
        items.append(newItem)
    }
    func getAllItems()->[Item]
    {
        return items
    }
    
    func addinHistory(newhistory :History)
    {
        histories.append(newhistory)
    }
    
    func getHistory()->[History]
    {
        return histories
    }
}
