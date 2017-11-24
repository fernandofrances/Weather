//
//  WebServiceConfiguration.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

internal struct WebServiceConfiguration {
    let apiKey: String
    private class webServiceConfig {}
    static let `default` =  WebServiceConfiguration(apiKey: Bundle(for: WebServiceConfiguration.webServiceConfig.self).infoDictionary?["API_KEY"] as? String ?? "")
    
    var paramenters: [String: String] {
        return ["APPID": "6fe0a81d266871b689165efd5b884f59",
                "units": "metric"]
    }
}
