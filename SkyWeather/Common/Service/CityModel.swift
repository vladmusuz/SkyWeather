//
//  CityModel.swift
//  Weather
//
//  Created by Komolbek Ibragimov on 4/10/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import Foundation

struct MyCities {
    
    static var citiesArray        = [String]()
    static var cityTempArray      = [Double]()
    static var cityBackImageArray = [String]()
    
    static var cityWithDetails = String()
    static var newCity         = String()
}

struct CityList {
    static var citiesArray = [String]()
}

struct Capital: Codable {

    var capital: String
}


