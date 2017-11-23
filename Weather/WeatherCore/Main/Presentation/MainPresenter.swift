//
//  MainPresenter.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

protocol MainView: class {
    func update(with forecast: Forecast)
}

final class MainPresenter {
    private let repository: MainRepository
    weak var view: MainView?
    
    init(repository: MainRepository){
        self.repository = repository
    }
    
    func didLoad() {
        
    }
    
}

extension MainPresenter {
    func loadForecast(city: String) {
        repository.forecastForCity(city: city) { (forecast: Forecast) in
            self.view?.update(with: forecast)
        }
    }
}
