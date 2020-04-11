//
//  AlertHelper.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/10/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func alert(withTitle title: String, message: String, andStyle style: UIAlertController.Style) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)

        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension CityViewController {
    
    func alert(withTitle title: String, message: String, andStyle style: UIAlertController.Style) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)

        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
