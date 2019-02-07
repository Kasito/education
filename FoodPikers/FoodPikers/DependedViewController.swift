//
//  DependedViewController.swift
//  FoodPikers
//
//  Created by user on 1/21/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class DependedViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonPrassed(_ sender: UIButton) {
        self.label.text = Grew.isInGrew(player:
            Grew.Player.init(name: self.name[self.picker.selectedRow(inComponent: 0)],
                                                        lastName: self.lastName[self.picker.selectedRow(inComponent: 1)],
                                                        rang: "")) ? "Верно" : "Неверно"
        self.label.isHidden = false
    }
    
    private var name: [String]!
    private var lastName: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name = Grew.name
        self.lastName = Grew.lastName
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return self.name.count
        } else {
            return self.lastName.count 
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? self.name[row] : (self.lastName + [Grew.findRangForName(self.name[self.picker.selectedRow(inComponent: 0)])!])[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.label.isHidden = true
        if component == 0 {
        self.picker.reloadComponent(1)
        self.picker.selectedRow(inComponent: 1)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let size = self.picker.bounds.width
        return component == 0 ? size / 3 : size / 3 * 2
    }
}
