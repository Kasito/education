//
//  DateViewController.swift
//  FoodPikers
//
//  Created by user on 1/21/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "\(self.dataPicker.date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataPicker.setDate(Date(), animated: false)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
