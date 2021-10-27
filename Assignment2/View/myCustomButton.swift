//
//  myCustomButton.swift
//  Assignment2
//
//  Created by user202404 on 10/26/21.
//

import UIKit

class myCustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
                    
    }
    
    required init?(coder: NSCoder) {
        
        //Layer
        super.init(coder: coder)
        layer.cornerRadius = 24
    }

}

