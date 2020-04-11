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
}
struct Weather: Codable {
    let main: String
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
    let pressure: Int
    let humidity: Int
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Double
}

