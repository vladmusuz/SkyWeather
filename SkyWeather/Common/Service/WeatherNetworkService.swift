//
//  WeatherNetworkService.swift
//  SkyWeatherApp
//
//  Created by Komolbek Ibragimov on 4/7/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import Foundation

struct WeatherNetworkService {
    
    enum WeatherDataGetType {
        case byCity
        case byCoordinates
    }
    
    static func getWeatherData(type: WeatherDataGetType, completion: @escaping (Result<Model, Error>) -> Void) {
        
        let city = (MainModel.cityName as NSString).replacingOccurrences(of: " ", with: "%20")
        let apiKey = "d32afaac5ea627ea1d2634659bbbc17e"
        let citySource = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        let geoSource = "https://api.openweathermap.org/data/2.5/weather?lat=\(UserCoordinate.lat)&lon=\(UserCoordinate.lon)&appid=\(apiKey)"
        
        var url = ""
        
        switch type {
        case .byCity: url = citySource
        case .byCoordinates: url = geoSource
            print(UserCoordinate.lat, UserCoordinate.lon)
        }
        
        guard let citiesUrl = URL(string: url) else {fatalError()}
        
        URLSession.shared.dataTask(with: citiesUrl) { (data, response, error) in
            guard let data = data, error == nil else {return}
            
            do {
                let dataFromJson = try JSONDecoder().decode(Model.self, from: data)
                
                completion( .success(dataFromJson))
                
            } catch {
                completion( .failure(error))
                print(error)
            }
        }.resume()
    }
}
