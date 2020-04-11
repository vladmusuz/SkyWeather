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
    
    static var searchCityArray  = [String]()
    static var isSearching      = false
    
    static var isLocationEnable = false
    static var isCitySelected   = false
}

struct UserCoordinate {
    static var lat = Double()
    static var lon = Double()
}

struct Cells {
    static let cityListCellIdentifier = "cityListCellIdentifier"
}

struct Capital: Codable {
    var capital: String
}

struct WeatherState {
    static func weatherStateDefine(weatherState: String) {
        
        if weatherState == "Clouds" {
            MainModel.weatherStateImage = UIImage.MyCityBackImage.clouds
            MainModel.mainBackImage = UIColor(patternImage: UIImage.MyCityBackImage.backCloud)
            MainModel.descrition = Recommendations.clouds
        } else if weatherState == "Clear" {
            MainModel.weatherStateImage = UIImage.MyCityBackImage.clear
            MainModel.mainBackImage = UIColor(patternImage: UIImage.MyCityBackImage.backClear)
            MainModel.descrition = Recommendations.clear
        } else if weatherState == "Rain" {
            MainModel.weatherStateImage = UIImage.MyCityBackImage.rain
            MainModel.mainBackImage = UIColor(patternImage: UIImage.MyCityBackImage.backRain)
            MainModel.descrition = Recommendations.rain
        } else if weatherState == "Snow" {
            MainModel.weatherStateImage = UIImage.MyCityBackImage.snow
            MainModel.mainBackImage = UIColor(patternImage: UIImage.MyCityBackImage.backSnow)
            MainModel.descrition = Recommendations.snow
        } else if weatherState == "Mist" || weatherState == "Haze" {
            MainModel.weatherStateImage = UIImage.MyCityBackImage.mist
            MainModel.mainBackImage = UIColor(patternImage: UIImage.MyCityBackImage.backMist)
            MainModel.descrition = Recommendations.mist
        }
    }
}

struct Recommendations {
    static let clouds = "Strong wind expected Monday, with temperature in low 50s"
    static let mist = "Windy and increasingly cloudy with sunny periods"
    static let clear = "Cold and dry in the morning, warmer later"
    static let rain = "Rain expected at night, with 40 percent chance of showers"
    static let snow = "Windy and cloudy with occasional snow"
}


