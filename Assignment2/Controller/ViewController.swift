//
//  ViewController.swift
//  Assignment2
//
//  Created by user202404 on 10/25/21.
//


import UIKit

class ViewController: UIViewController ,
                      UITableViewDelegate,
                      UITableViewDataSource{
    
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var itemTable: UITableView!
    
    
    var manager: Manager = Manager()
    var itemName:[String] = ["Pants","Shoes","Hats","Tshirts","Dresses"]
    var itemQuantity: [Int] = [20,50,10,10,24]
    var itemPrice: [Float] = [50.9,90,20.5,21.75,69.53]
    
    var index = 0
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<itemName.count
        {
            manager.addNewItems(newItem: Item(name: itemName[i], quantity: itemQuantity[i], price: itemPrice[i]))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        itemTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.getAllItems().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! myCustomTableViewCell
        
        cell.itemName.text = manager.getAllItems()[indexPath.row].itemName

        cell.itemQuantity.text = String(manager.getAllItems()[indexPath.row].itemQuantity)

        cell.itemPrice.text = String(manager.getAllItems()[indexPath.row].itemPrice)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        index = indexPath.row
        let name = manager.getAllItems()[indexPath.row].itemName
        typeLabel.text? =  name
        quantityLabel.text = ""
        totalLabel.text = ""
    }
    
    
    @IBAction func numberClicked(_ sender: myCustomButton) {
        
        var quantity:Float;
        var totalprice : Float;
        
        let unitPrice = manager.getAllItems()[index].itemPrice
        counter += 1
        let number = sender.titleLabel?.text
        if(counter == 1)
        {
            quantityLabel.text = number!
        }
        else
        {
            quantityLabel.text?.append(number!)
        }
            
        quantity = Float(quantityLabel.text!)!
        totalprice = quantity * unitPrice
        totalLabel.text = String(totalprice)
        
    }
    
    
    
    @IBAction func buyClicked(_ sender: myCustomButton) {
        let quantityEntered = Int(quantityLabel.text!)!
        let quantityLeft = manager.getAllItems()[index].itemQuantity
        
        if quantityEntered > quantityLeft {
            let alert = UIAlertController(title: "Error", message: "Out of Stock", preferredStyle: .alert)

            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)

            alert.addAction(action)

            present(alert, animated: true, completion: nil)
            quantityLabel.text = "Quantity"
            totalLabel.text = "Total"
            typeLabel.text = "Type"
            counter = 0
        }
        else
        {
            manager.getAllItems()[index].itemQuantity = quantityLeft - quantityEntered
            
            let date = Date()
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "MM/dd/yyyy, HH:mm:ss"
            manager.addinHistory(newhistory: History(name: typeLabel.text!, quantity: quantityEntered,total: Double(totalLabel.text!)!,date: dateformatter.string(for: date)!))
            
            
            quantityLabel.text = "Quantity"
            totalLabel.text = "Total"
            typeLabel.text = "Type"
            counter = 0
        }
        
        itemTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let MVC = segue.destination as? ManagerViewController
        MVC!.manager = manager
    }
    
}



