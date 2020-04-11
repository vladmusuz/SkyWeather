//
//  UILabel+Shadow.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/11/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import UIKit

extension UILabel {
    func textDropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 3.5, height: 3.5)
    }

    static func createCustomLabel() -> UILabel {
        let label = UILabel()
        label.textDropShadow()
        return label
    }
}

extension UIFont {
    static let customBigSize = UIFont.boldSystemFont(ofSize: 45)
    static let customSmallSize = UIFont.boldSystemFont(ofSize: 25)
    static let customVerySmallSize = UIFont.systemFont(ofSize: 16)
}
