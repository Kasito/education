//
//  Grew.swift
//  FoodPikers
//
//  Created by user on 1/22/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

class Grew {
    
    class Player {
        
        var name: String
        var lastName: String
        var rang: String
        
        init(name: String, lastName: String, rang: String) {
            self.name = name
            self.lastName = lastName
            self.rang = rang
        }
    }
    static var crew = [
        Player(name: "Том", lastName: "Булб", rang: "Капітан"),
        Player(name: "Федя", lastName: "", rang: "Гравець"),
        Player(name: "Мурм", lastName: "Доді", rang: "Захісник"),
        Player(name: "убрб", lastName: "", rang: "Капітан - солдат"),
        Player(name: "Ваня", lastName: "Булуб", rang: "Леутенант"),
        Player(name: "7-з-9", lastName: "третичне добавлення", rang: "хз"),
        ]
    
    static func isInGrew (player: Player) -> Bool {
        
        for i in self.crew {
            if i.name == player.name && i.lastName ==  player.lastName {
                return true
            }
        }
        return false
    }
    
    static var name: [String] {
        return self.crew.map{$0.name}
    }
    
    static var lastName: [String] {
        return self.crew.map{$0.lastName}
    }
    
    static func findRangForName (_ name: String) -> String? {
        return self.crew.filter{$0.name == name}.first?.rang
    }
}
