//
//  CityNetworkService.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/11/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import Foundation

struct CityNetworkSevice {
    
    static func getCity(completion: @escaping(Result<[Capital], Error>) -> Void) {
        
        guard let citiesUrl = URL(string: "https://restcountries.eu/rest/v2/all") else {fatalError()}
        
        URLSession.shared.dataTask(with: citiesUrl) { (data, response, error) in
            guard let data = data, error == nil else {return}
            
            do {
                let cityFromJson = try JSONDecoder().decode([Capital].self, from: data)
                completion( .success(cityFromJson))
                
            } catch {
                completion( .failure(error))
                print(error)
            }
        }.resume()
    }
}
