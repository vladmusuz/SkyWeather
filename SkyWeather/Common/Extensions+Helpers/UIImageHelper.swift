//
//  UIImageHelper.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/11/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import UIKit

extension UIImage {
    
    enum MyCityBackImage {
     
        static var clear = imageNamed("clearState")
        static var rain = imageNamed("rainState")
        static var clouds = imageNamed("cloudState")
        static var snow = imageNamed("snowState")
        static var mist = imageNamed("mistState")
    }
    
    private static func imageNamed(_ name: String) -> UIImage {
        return UIImage(named: name) ?? UIImage()
    }
    
}
