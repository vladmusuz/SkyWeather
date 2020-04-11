//
//  CityListViewController.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/11/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    var myView = CityListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func loadView() {
        view = myView
    }
    
    private func setupView() {
        title = "Select City"
        
        myView.tableView.delegate   = self
        myView.tableView.dataSource = self
        myView.searchBar.delegate   = self
        
        myView.tableView.register(CityListTabelViewCell.self, forCellReuseIdentifier: Cells.cityListCellIdentifier)
    }
}

//MARK: - UITableViewDataSource

extension CityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if MainModel.isSearching {
            return MainModel.searchCityArray.count
        } else {
            return MainModel.cityArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.cityListCellIdentifier, for: indexPath) as! CityListTabelViewCell
        
        if MainModel.isSearching {
            let city             = MainModel.searchCityArray[indexPath.row]
            cell.textLabel?.text = city
            
        } else {
            let city             = MainModel.cityArray[indexPath.row]
            cell.textLabel?.text = city
        }
        return cell
    }
}

//MARK: - UITableViewDelegate

extension CityViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var selectedCity = MainModel.cityArray[indexPath.row]
        
        if MainModel.isSearching {
            selectedCity = MainModel.searchCityArray[indexPath.row]
        }
        
        if MainModel.cityName.contains(selectedCity) {
            alert(withTitle: "Warning", message: "This city already added", andStyle: .alert)
            
        } else if selectedCity == "" {
            alert(withTitle: "Warning", message: "Sorry, this city data is not available", andStyle: .alert)
            
        } else {
            MainModel.searchingCity = selectedCity
            MainModel.cityName      = selectedCity
            myView.searchBar.text   = ""
            MainModel.isSearching   = false
            
            getWeatherData()
            
            navigationController?.popViewController(animated: true)
        }
        
        
    }
}

//MARK: - UISearchBarDelegate

extension CityViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        MainModel.searchCityArray = MainModel.cityArray.filter({$0.prefix(searchText.count) == searchText})
        MainModel.isSearching     = true
        
        myView.tableView.reloadData()
    }
}

//MARK: - Get weather data

extension CityViewController {
    
    private func getWeatherData() {
        WeatherNetworkService.getWeatherData { (result) in
            DispatchQueue.main.async {
                
                switch result {
                case .failure(let error): print("error while getting data \(error)")
                    
                case .success(let model):
            
                    let temp = model.main.temp - 273.15 + 1
                    MainModel.temp = String(format: "%.f", temp)
                    
                    model.weather.forEach({
                        
                        if $0.main == "Clouds" {
                            MainModel.weatherStateImage = UIImage.MyCityBackImage.clouds
                        } else if $0.main == "Clear" {
                            MainModel.weatherStateImage = UIImage.MyCityBackImage.clear
                        } else if $0.main == "Rain" {
                            MainModel.weatherStateImage = UIImage.MyCityBackImage.rain
                        } else if $0.main == "Snow" {
                            MainModel.weatherStateImage = UIImage.MyCityBackImage.snow
                        } else if $0.main == "Mist", $0.main == "Haze" {
                            MainModel.weatherStateImage = UIImage.MyCityBackImage.mist
                        }
                        print($0.main)
                        MainModel.descrition = $0.main
                    })
                }
            }
        }
    }
}
