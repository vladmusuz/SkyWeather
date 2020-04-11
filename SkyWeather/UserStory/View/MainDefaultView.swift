//
//  MainView.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/10/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import UIKit

class MainDefaultView: UIView {
    
    //MARK: - Private Properties
    
    private let currentLocationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("My Location", for: .normal)
        btn.backgroundColor = .systemBlue
        return btn
    }()
    
    private let newCityButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor.opacityBlack
        btn.setTitle("Select City", for: .normal)
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
        backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backDefaultImage"))
        [
            currentLocationButton,
            newCityButton
        ].forEach({
            $0.setTitleColor(.white, for: .normal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layer.cornerRadius                        = 8
            addSubview($0)
        })
        newCityButton.addTarget(self, action: #selector(newCityButtonPressed), for: .touchUpInside)
        currentLocationButton.addTarget(self, action: #selector(locateButtonPressed), for: .touchUpInside)
        
        setupConst()
    }
    
    private func setupConst() {
        let const = [
            currentLocationButton.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            currentLocationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            currentLocationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            currentLocationButton.heightAnchor.constraint(equalToConstant: 60),
            
            newCityButton.trailingAnchor.constraint(equalTo: currentLocationButton.trailingAnchor, constant: -20),
            newCityButton.topAnchor.constraint(equalTo: currentLocationButton.bottomAnchor, constant: 20),
            newCityButton.heightAnchor.constraint(equalTo: currentLocationButton.heightAnchor),
            newCityButton.leadingAnchor.constraint(equalTo: currentLocationButton.leadingAnchor, constant:  20),
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
