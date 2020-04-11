//
//  MainViewController.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/10/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol MainViewControllerDelegate: class {
    func newCityButtonPressed()
    func locateButtonPressed()
}

class MainViewController: UIViewController, MainViewControllerDelegate {
    
    //MARK: - Properties
    
    private let myView        = MainView()
    private let myDefaultView = MainDefaultView()
    var locationManager       = CLLocationManager()
    
    //MARK: - Main
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        getCity()
        getUserLocation()
    }
    
    override func loadView() {
        view = MainModel.isCitySelected ? myView : myDefaultView
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !MainModel.cityName.isEmpty, !MainModel.temp.isEmpty {
            setMainValues()
        }
    }
    
    //MARK: - Methods
    
    internal func newCityButtonPressed() {
        navigationController?.pushViewController(CityViewController(), animated: true)
    }
    
    internal func locateButtonPressed() {
        
        if !CLLocationManager.locationServicesEnabled() {
            alert(withTitle: "Warning", message: "Location Service is disabled", andStyle: .alert)
        } else {
            getLocationWeatherDate()
        }
    }
    
    func setMainValues() {
        myView.cityName          = MainModel.cityName
        myView.temp              = "\(MainModel.temp)ºC"
        myView.weatherStateImage = MainModel.weatherStateImage
        myView.backgroundColor   = MainModel.mainBackImage
        view                     = myView
    }
    
    //MARK: - Private Methods
    
    private func getUserLocation() {
        locationManager                 = CLLocationManager()
        locationManager.delegate        = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func setupView() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        self.navigationController?.navigationBar.shadowImage   = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor        = .clear
        
        myView.delegate        = self
        myDefaultView.delegate = self
    }
}

//MARK: - CLLocationManagerDelegate

extension MainViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("error:: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        UserCoordinate.lat = locValue.latitude
        UserCoordinate.lon = locValue.longitude
        
        getLocationWeatherDate()
    }
}

//MARK: - Get City Data

extension MainViewController {
    
    fileprivate func getCity() {
        
        CityNetworkSevice.getCity { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error): print("\(error) in getCity()")
                    
                case .success(let cities):
                    cities.forEach({
                        
                        if $0.capital != "" {
                            MainModel.cityArray.append($0.capital)
                            let sortedCityList   = MainModel.cityArray.sorted()
                            MainModel.cityArray  = sortedCityList
                        }
                    })
                }
            }
        }
    }
}

//MARK: - Current Location Weather

extension MainViewController {
    
    func getLocationWeatherDate() {
        
        WeatherNetworkService.getWeatherData(type: .byCoordinates) { (result) in
            
            DispatchQueue.main.async {
                switch result {
                case .failure(let error): print("error while fetching location data \(error)")
                    
                case .success(let model):
                    let temp = model.main.temp - 273.15 + 1
                    
                    MainModel.temp           = String(format: "%.f", temp)
                    MainModel.cityName       = model.name
                    MainModel.isCitySelected = true
                    
                    model.weather.forEach({
                        WeatherState.weatherStateDefine(weatherState: $0.main)
                        MainModel.descrition = $0.main
                        
                    })
                    
                    self.setMainValues()
                }
            }
        }
    }
}
