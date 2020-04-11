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
    static var mainBackImage     = UIColor(patternImage: UIImage())
    
    static var defaultDescText = Description.text
    
    static var searchCityArray  = [String]()
    static var isSearching      = false
    
    static var isLocationEnable = false
    static var isCitySelected   = false
}

struct Cells {
    static let cityListCellIdentifier = "cityListCellIdentifier"
}

struct Capital: Codable {
    var capital: String
}

struct Description {
    static let text = "Hi, to be able to track your weather details in your Location, please enable the Location Service in Settings. In other case you can Select any City by clicking 'Select' button"
}
