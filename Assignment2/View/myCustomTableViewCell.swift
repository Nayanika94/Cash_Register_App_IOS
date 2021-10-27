//
//  myCustomTableViewCell.swift
//  Assignment2
//
//  Created by user202404 on 10/26/21.
//

import UIKit

class myCustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemQuantity: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
