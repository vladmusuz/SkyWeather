//
//  CityListViewController.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/11/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    private let myView = CityListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select City"
    }
    
    override func loadView() {
        view = myView
    }
}

extension CityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainModel.cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.cityListCellIdentifier, for: indexPath) as! CityListTabelViewCell
        
        let city             = MainModel.cityArray[indexPath.row]
        cell.textLabel?.text = city
        
        return cell
    }
    
    
}
