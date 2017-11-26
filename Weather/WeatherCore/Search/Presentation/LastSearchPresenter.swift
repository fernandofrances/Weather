//
//  LastSearchPresenter.swift
//  Weather
//
//  Created by Fernando Frances on 24/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

protocol LastSearchView: class {
    func update(with cities: [String])
    func dismissSearch(with city: String)
}


final class LastSearchPresenter {
    
    private var citiesSearched: [String]?
    weak var view: LastSearchView?
    
    func didLoad() {
        if let lastSearched = UserDefaults.standard.stringArray(forKey: "lastSearched"){
            print("Last searched cities from Defaults, ready to show: \(lastSearched)")
            self.view?.update(with: lastSearched)
        }
        
    }
    
    func didSelect(city: String) {
        view?.dismissSearch(with: city)
    }
}
