//
//  Wage.swift
//  KeyPath
//
//  Created by user on 1/16/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

class Wage {
    class func hours(forWage wage: Double, withPrice price: Double) -> Int {
        return Int((price / wage).rounded(.up))
    }
}
