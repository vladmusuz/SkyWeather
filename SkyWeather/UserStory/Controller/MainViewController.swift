//
//  MainViewController.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/10/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import UIKit
import CoreLocation

protocol MainViewControllerDelegate: class {
    func newCityButtonPressed()
    func locateButtonPressed()
}

class MainViewController: UIViewController, MainViewControllerDelegate {
    
    
    //MARK: - Properties
    
    internal let myView = MainView()
    let locationManager = CLLocationManager()
    
    //MARK: - Main
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getWeatherData()
        getUserLocation()
    }
    
    override func loadView() {
        view = myView
    }
    
    //MARK: - Methods
    
    internal func newCityButtonPressed() {
        navigationController?.pushViewController(CityViewController(), animated: true)
    }
    
    internal func locateButtonPressed() {
        
    }
    
    //MARK: - Private Methods
    
    private func getUserLocation() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate        = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            
            locationManager.startUpdatingLocation()
        }
    }
    
    private func setupView() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage   = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor        = .clear
        self.navigationController?.navigationBar.tintColor     = .white
        
        myView.delegate = self
    }
    
    
}

//MARK: - Get weather data

extension MainViewController {
    
    private func getWeatherData() {
        WeatherNetworkService.getWeatherData { (result) in
            DispatchQueue.main.async {
                
                switch result {
                case .failure(let error): print("error while getting data \(error)")
                    
                case .success(let model):
                    MainModel.temp = Int(model.main.temp)
                    model.weather.forEach({
                        MainModel.descrition = $0.main
                    })
                }
            }
        }
    }
}

//MARK: - CLLocationManagerDelegate

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        MainModel.isLocationEnable = true
    }
}
