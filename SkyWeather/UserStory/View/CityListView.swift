//
//  CityListView.swift
//  SkyWeather
//
//  Created by Komolbek Ibragimov on 4/11/20.
//  Copyright © 2020 VladMus. All rights reserved.
//

import UIKit

class CityListView: UIView {
    
    //MARK: - Properties
    
    let searchBar: UISearchBar = {
       let sb = UISearchBar()
        sb.barTintColor = .white
        return sb
    }()
    
    let tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .plain)
        tb.separatorColor = .white
        return tb
    }()
    
    //MARK: - Main
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    //MARK: - Methods
    
    private func setupView() {
        backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backMist"))
        [
            searchBar,
            tableView
        ].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = UIColor.opacityMiddleGray
            addSubview($0)
        })
        setupConst()
    }
    
    private func setupConst() {
        let const = [
            searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(const)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
