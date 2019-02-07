//
//  PartyMembersVCViewController.swift
//  BarcelonaMVC
//
//  Created by user on 1/15/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class PartyMembersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var players = [Int: Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let playersBase = Player.players {
            for player in playersBase {
                self.players[player.number] = player
            }
        }
    }
    
    // MARK: - TabelView
    func  numberOfSections(in: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell") {
            let player = getPlayerFromDictionary(byAbsolyteNumber: indexPath.row)
            cell.imageView?.image = UIImage(named: String(player.number))
            cell.textLabel?.text = "\(player.number): \(player.name)"
            cell.detailTextLabel?.text = player.role
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let playerController = segue.destination as? PlayerVC {
            playerController.player = sender as? Player
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.performSegue(withIdentifier: "ShowPlayer", sender: self.getPlayerFromDictionary(byAbsolyteNumber: indexPath.row))
    }
    
    @IBAction func unwindToPartyMembersVC(segue: UIStoryboardSegue) {
    }
    
    func getPlayerFromDictionary(byAbsolyteNumber number: Int) -> Player {
        return Array(self.players.values).sorted { $0.number < $1.number }[number]
    }
}
