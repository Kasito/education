//
//  ViewController.swift
//  Airdrop
//
//  Created by user on 1/9/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var camBtn: UIButton!
    @IBOutlet weak var galBtn: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func camButtonTapped(_ sender: UIButton) {
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        imagePicker.showsCameraControls = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func galButtonTapped(_ sender: UIButton) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        let activityItems = [pictureView.image!]
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton(btn: camBtn)
        configureButton(btn: galBtn)
        configureButton(btn: sendBtn)
        
        imagePicker.delegate = self
    }
    
    private func configureButton(btn: UIButton) {
        btn.backgroundColor = UIColor(red: 27/255, green: 89/255, blue: 147/255, alpha: 1.0)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.lightGray, for: .highlighted)
        btn.layer.cornerRadius = 4.0
        btn.layer.shadowOpacity = 0.6
        btn.layer.shadowOffset = CGSize(width: 2, height: 2)
        btn.layer.shadowRadius = 2
        pictureView.image = UIImage(named: "1")
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // UIImagePickerControllerDelegate
    
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imageFromPC = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        pictureView.image = imageFromPC
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
