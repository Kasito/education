//
//  Player.swift
//  BarcelonaMVC
//
//  Created by user on 1/15/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

class Player {
    var number: Int
    var name: String
    var role: String
    
    init(number: Int, name: String, role: String) {
        self.number = number
        self.name = name
        self.role = role
    }
    
    static var players: [Player]? {
        var barcPlayers: [Player]?
        
        guard let path = Bundle.main.path(forResource: "BarcPlayers", ofType: "plist") else {
            print("Error path")
            return barcPlayers
        }
        
        let url = URL(fileURLWithPath: path)
        guard let dictionary = NSDictionary(contentsOf: url) else {
            print("Error dictionary")
            return barcPlayers
        }
        
        guard let players = dictionary["Players"] as? NSDictionary else {
            print("Error players")
            return barcPlayers
        }
        
        barcPlayers = []
        
        for playersDesctiption in players {
            guard let description = playersDesctiption.value as? NSDictionary else { return nil }
            barcPlayers?.append(Player(
                number: Int(playersDesctiption.key as! String)!,
                name: description["Name"] as! String,
                role: description["Role"] as! String
            ))
        }
        return barcPlayers?.sorted { $0.number < $1.number }
    }
}
