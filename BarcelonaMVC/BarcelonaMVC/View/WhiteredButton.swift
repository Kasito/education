//
//  WhiteredButton.swift
//  BarcelonaMVC
//
//  Created by user on 1/15/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class WhiteredButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    self.imageView?.image = (self.imageView?.image?.withRenderingMode(.alwaysTemplate))
self.imageView?.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
