//
//  MainRepository.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

final class MainRepository {
    private let webService: WebService
    init(webService: WebService){
        self.webService = webService
    }
    
    func forecastForCity(city: String, onResults: @escaping (Forecast) -> Void) -> Void {
        webService.load(from: .forecastForCity(city: city)) { (forecast: Forecast) in
            print(forecast)
            onResults(forecast)
        }
    }
}
