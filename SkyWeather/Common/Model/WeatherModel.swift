//
//  WeatherModel.swift
//  Weather
//
//  Created by Komolbek Ibragimov on 4/10/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import Foundation

// MARK: - Weather

struct Model: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
}
struct Weather: Codable {
    let main: String
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
}

