//
//  Forecast.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

//According to the API Request
struct Forecast: Decodable {
    struct Weather: Decodable{
        let main: String
        let description: String
        var icon : String
    }
    struct Main: Decodable{
        let temp: Float
        let pressure: Float
        let humidity: Int
        let temp_min: Float
        let temp_max: Float
    }
    struct Wind: Decodable{
        let speed: Float
    }

    let main: Main
    let weather: [Weather]
    let wind: Wind
    let name: String
}

