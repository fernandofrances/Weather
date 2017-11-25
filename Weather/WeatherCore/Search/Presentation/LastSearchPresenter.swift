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
        let cities = ["Madrid","London","New York", "Moscow"]
        self.view?.update(with: cities)
    }
    
    func didSelect(city: String) {
        view?.dismissSearch(with: city)
    }
}
