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
        getUserLocation()
        getCity()
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
        self.navigationController?.navigationBar.tintColor     = .white
        
        myView.delegate        = self
        myDefaultView.delegate = self
    }
}

//MARK: - CLLocationManagerDelegate

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
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
                            MainModel.cityArray = sortedCityList
                        }
                    })
                }
            }
        }
    }
}
