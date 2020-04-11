//
//  WeatherNetworkService.swift
//  SkyWeatherApp
//
//  Created by Komolbek Ibragimov on 4/7/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import Foundation

struct WeatherNetworkService {
    
    static func getWeatherData(completion: @escaping (Result<Model, Error>) -> Void) {
        
        let city = (MainModel.searchingCity as NSString).replacingOccurrences(of: " ", with: "%20")
        let source = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=d32afaac5ea627ea1d2634659bbbc17e"
        guard let citiesUrl = URL(string: source) else {fatalError()}
        
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
