//
//  ViewController.swift
//  MyFirstMillion
//
//  Created by user on 1/15/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var diceImage1: UIImageView!
    
    @IBOutlet weak var diceImage2: UIImageView!
    
    @IBAction func buttonTapped(_ sender: OurOwnButton) {
        randomixeDices()
    }
    
    func diceRoll(to upperBound: UInt32) -> UInt32 {
        let diceValue = arc4random_uniform(upperBound) + 1
        print(diceValue)
        return diceValue == 0 ? diceRoll(to: upperBound) : diceValue
    }
    
    func randomixeDices() {
        let dice1Value = diceRoll(to: 6)
        let dice2Value = diceRoll(to: 6)
        self.diceImage1.image = UIImage(named: "dice\(dice1Value)")
        self.diceImage2.image = UIImage(named: "dice\(dice2Value)")
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        self.randomixeDices()
    }
}

