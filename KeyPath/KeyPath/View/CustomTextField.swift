//
//  CustomTextField.swift
//  KeyPath
//
//  Created by user on 1/16/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    func updateView() {
        self.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.003921568627, blue: 0.003921568627, alpha: 0.0025)
        self.layer.cornerRadius = 5
        self.textAlignment = .center
        self.clipsToBounds = true
        
        if let placeHolderText = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
            self.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.updateView()
    }
   
    override func prepareForInterfaceBuilder() {
        self.updateView()
    }

    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20
        let currencySignLabel = UILabel(frame: CGRect(x: 5, y: (self.frame.height - size) / 2, width: size, height: size))
        currencySignLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        currencySignLabel.textAlignment = .center
        currencySignLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        currencySignLabel.cornerRadiusRation = 0.2
        currencySignLabel.clipsToBounds = true
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        currencySignLabel.text = formatter.currencySymbol
        
        self.addSubview(currencySignLabel)
    }
}
