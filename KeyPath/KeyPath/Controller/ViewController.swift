//
//  ViewController.swift
//  KeyPath
//
//  Created by user on 1/16/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wageTextField: UITextField!
    
    @IBOutlet weak var ItemPriceTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    @IBAction func clerButtonPresed(_ sender: UIButton) {
        self.resultLabel.isHidden = true
        self.hoursLabel.isHidden = true
        self.wageTextField.text = ""
        self.ItemPriceTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let calculateButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        calculateButton.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        calculateButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calculateButton.setTitle("Вичеслить", for: .normal)
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
       
        wageTextField.inputAccessoryView = calculateButton
        ItemPriceTextField.inputAccessoryView = calculateButton
        
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
    }

    @objc func calculate() {
        if let wageText = self.wageTextField.text, let priceText = self.ItemPriceTextField.text {
            if let wage = Double(wageText), let price = Double(priceText) {
                self.view.endEditing(true)
                self.resultLabel.isHidden = false
                self.hoursLabel.isHidden = false
                self.resultLabel.text = "\(Wage.hours(forWage: wage, withPrice: price))"
            }
        }
    }
}
