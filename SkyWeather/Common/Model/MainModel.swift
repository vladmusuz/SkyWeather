//
//  MainModel.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/10/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import Foundation

struct MainModel {
    
    static var cityArray = [String]()
    
    static var cityName   = String()
    static var temp       = Int()
    static var descrition = String()
    
    static var searchingCity = String()
    
    static var isLocationEnable = false
    
    static let defaultCityName    = "City: --:--"
    static let defaultTemp        = "--:--"
    static let defaultDescription = " Description: --:--"
}

struct Cells {
    static let cityListCellIdentifier  = "cityListCellIdentifier"
}
