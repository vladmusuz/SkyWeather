//
//  MainModel.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/10/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import UIKit

struct MainModel {
    
    static var cityArray = [String]()
    
    static var cityName          = String()
    static var temp              = String()
    static var descrition        = String()
    static var weatherStateImage = UIImage()
    
    static let defaultCityName    = "City: --:--"
    static let defaultTemp        = "--:--"
    static let defaultDescription = " Description: --:--"
    
    static var searchCityArray  = [String]()
    static var isSearching      = false
    
    static var searchingCity = String()
    
    static var isLocationEnable = false
}

struct Cells {
    static let cityListCellIdentifier = "cityListCellIdentifier"
}

struct Capital: Codable {
    var capital: String
}
