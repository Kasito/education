//
//  CustomViewController.swift
//  FoodPikers
//
//  Created by user on 1/21/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit
import AudioToolbox

class LeavingDeathViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private var winSoundID: SystemSoundID = 0
    private var processSoundId: SystemSoundID = 0
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        for i in 0...2 {
            self.picker.selectRow(Int(arc4random_uniform(UInt32(self.arrImage.count - 1))), inComponent: i, animated: true)
        }
        
        if self.picker.selectedRow(inComponent: 0) == self.picker.selectedRow(inComponent: 1) &&  self.picker.selectedRow(inComponent: 2) == self.picker.selectedRow(inComponent: 0) {
            self.label.isHidden = false
            self.label.text = "Победа"
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                AudioServicesPlayAlertSound(self.winSoundID)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                AudioServicesPlayAlertSound(self.processSoundId)
            }
        }
    }
    
    var arrImage =  [UIImage(named: "002_pumpkin"),
                     UIImage(named: "005_candies"),
                     UIImage(named: "008_living_dead")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let winSound = Bundle.main.url(forResource: "win", withExtension: "wav")
        let processSound = Bundle.main.url(forResource: "process", withExtension: "wav")
        
        AudioServicesCreateSystemSoundID(winSound! as CFURL, &winSoundID)
        AudioServicesCreateSystemSoundID(processSound! as CFURL, &processSoundId)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrImage.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return UIImageView(image: self.arrImage[row])
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
    
}
