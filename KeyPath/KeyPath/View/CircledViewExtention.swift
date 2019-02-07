//
//  CircledViewExtention.swift
//  KeyPath
//
//  Created by user on 1/16/19.
//  Copyright © 2019 user. All rights reserved.
//
import UIKit

extension UIView {
    @IBInspectable public var cornerRadiusRation: CGFloat {
        get {
            return self.layer.cornerRadius / self.frame.width
        }
        set {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = self.frame.width * max(0.0, min(1.0, newValue))
        }
    }
}
