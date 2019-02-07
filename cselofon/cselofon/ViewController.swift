//
//  ViewController.swift
//  cselofon
//
//  Created by user on 1/17/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    let soundArray = ["C", "D", "E", "F", "G", "A", "B"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, options: .defaultToSpeaker)
        } catch let error as NSError {
            print(error.description)
        }
        let soundURL = Bundle.main.url(forResource: "note_\(self.soundArray[sender.tag].lowercased())", withExtension: "wav")
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOf: soundURL!)
        } catch  {
            print(error)
        }
        self.audioPlayer.play()
    }
}
