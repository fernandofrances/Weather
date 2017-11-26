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
    
    func forecastForCity(city: String, onResults: @escaping (Forecast) -> Void, onError: @escaping (Error) -> Void, onWrongSearch: @escaping () -> Void) -> Void {
        webService.load(from: .forecastForCity(city: city), onSuccess: { (forecast: Forecast) in
            onResults(forecast)
        }, onError: { (error: Error?) in
            onError(error!)
        }) {
            onWrongSearch()
        }
    }
}
