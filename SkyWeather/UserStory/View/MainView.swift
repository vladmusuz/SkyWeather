//
//  MainView.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/10/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    //MARK: - Properties
    
    var cityName: String? {
        get { return cityNameLabel.text}
        set { cityNameLabel.text = newValue}
    }
    
    var temp: String? {
        get { return tempLabel.text}
        set { tempLabel.text = newValue}
    }
    
    var descriptionText: String? {
        get { return descriptionTextLabel.text}
        set { descriptionTextLabel.text = newValue}
    }
    
    //MARK: - Private Properties
    
    private let cityNameLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        return label
    }()
        
    private let descriptionTextLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    private let weatherStateImage: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "cloudState")
        return iv
    }()
    
    private let currentLocationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("My location", for: .normal)
        return btn
    }()
    
    private let newCityButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("New City", for: .normal)
        return btn
    }()
    
    //Delegate
    weak var delegate: MainViewControllerDelegate?
    
    //MARK: - Main
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    //MARK: - Methods
    
    private func setupView() {
        backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backImg4"))
        [
            cityNameLabel,
            weatherStateImage,
            tempLabel,
            descriptionTextLabel,
            currentLocationButton,
            newCityButton
        ].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
            addSubview($0)
        })
        [
            cityNameLabel,
            tempLabel,
            descriptionTextLabel
        ].forEach({
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = UIFont.systemFont(ofSize: 25)
        })
        [
            currentLocationButton,
            newCityButton
        ].forEach({
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 8
        })
        
        newCityButton.addTarget(self, action: #selector(newCityButtonPressed), for: .touchUpInside)
        currentLocationButton.addTarget(self, action: #selector(locateButtonPressed), for: .touchUpInside)
        
        setupConst()
    }
    
    private func setupConst() {
        let const = [
            weatherStateImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            weatherStateImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            weatherStateImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.55),
            weatherStateImage.heightAnchor.constraint(equalTo: weatherStateImage.widthAnchor),
            
            cityNameLabel.topAnchor.constraint(equalTo: weatherStateImage.bottomAnchor, constant: 20),
            cityNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cityNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            cityNameLabel.heightAnchor.constraint(equalToConstant: 70),
            
            tempLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
            tempLabel.leadingAnchor.constraint(equalTo: cityNameLabel.leadingAnchor),
            tempLabel.heightAnchor.constraint(equalTo: cityNameLabel.heightAnchor),
            tempLabel.trailingAnchor.constraint(equalTo: cityNameLabel.trailingAnchor),
            
            descriptionTextLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 20),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: cityNameLabel.leadingAnchor),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: cityNameLabel.trailingAnchor),
            descriptionTextLabel.heightAnchor.constraint(equalTo: cityNameLabel.heightAnchor, multiplier: 1.5),
            
            currentLocationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            currentLocationButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            currentLocationButton.heightAnchor.constraint(equalToConstant: 40),
            currentLocationButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            
            newCityButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            newCityButton.bottomAnchor.constraint(equalTo: currentLocationButton.bottomAnchor),
            newCityButton.heightAnchor.constraint(equalTo: currentLocationButton.heightAnchor),
            newCityButton.widthAnchor.constraint(equalTo: currentLocationButton.widthAnchor),
        ]
        NSLayoutConstraint.activate(const)
    }
    
    //MARK: - Selectors
    
    @objc private func newCityButtonPressed() {
        delegate?.newCityButtonPressed()
    }
    
    @objc private func locateButtonPressed() {
        delegate?.locateButtonPressed()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
