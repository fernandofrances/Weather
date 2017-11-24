//
//  Endpoint.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

internal enum Endpoint {
    case forecastForCity(city: String)
    case imageForForecast(icon: String)
}

internal extension Endpoint {
    func request(with baseURL: URL, adding parameters: [String: String]) -> URLRequest{
        let url = baseURL.appendingPathComponent(path)
        
        var newParameters = self.parameters
        parameters.forEach { newParameters.updateValue($1, forKey: $0) }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = newParameters.map(URLQueryItem.init)
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        return request
    }
}

private enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
}

private extension Endpoint {
    var method: HTTPMethod {
        switch self {
        case .forecastForCity:
            return .get
        case .imageForForecast:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .forecastForCity:
            return "/data/2.5/weather"
        case .imageForForecast(let icon):
            return "/img/w/\(icon)"
        }
    }
    
    var parameters: [String: String] {
        switch self{
        case .forecastForCity(let city):
            return ["q":city]
        case .imageForForecast:
            return [:]
        }
    }
}
