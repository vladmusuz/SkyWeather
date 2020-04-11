//
//  UIView+Shadow.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/10/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import UIKit

extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset  = CGSize(width: -1, height: 1)
        layer.shadowRadius  = 1
        
        layer.shadowPath         = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize    = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension UIColor {
    static let opacityLightGray = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
    static let opacityMiddleGray = UIColor(red: 0, green: 0, blue: 0, alpha: 0.35)
    static let opacityDarkGray = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45)
}
