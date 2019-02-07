//
//  OurOwnButton.swift
//  MyFirstMillion
//
//  Created by user on 1/15/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class OurOwnButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    self.layer.cornerRadius = 5
        self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.borderWidth = 2
    }

}
