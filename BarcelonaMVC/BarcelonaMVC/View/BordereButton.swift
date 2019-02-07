//
//  BordereButton.swift
//  BarcelonaMVC
//
//  Created by user on 1/15/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class BordereButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderWidth = 2
        self.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.003921568627, blue: 0.003921568627, alpha: 1)
    }
}
