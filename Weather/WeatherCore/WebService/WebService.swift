//
//  WebService.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

final internal class WebService {
    private let configuration: WebServiceConfiguration
    private let session = URLSession(configuration: .default)
    private let baseURL = URL(string: "http://api.openweathermap.org/data/2.5/weather")!
    private let decoder = JSONDecoder()
    
    init(configuration : WebServiceConfiguration){
        self.configuration = configuration
    }
    
    func load(from endpoint: Endpoint, onSuccess: @escaping (Forecast) -> Void) {
        let decoder = self.decoder
        let request = endpoint.request(with: baseURL, adding: configuration.paramenters)
        print("About to do the request")
        let task = session.dataTask(with: request.url!){ (data: Data?, response: URLResponse?, error: Error?) in
            OperationQueue.main.addOperation {
                if(error == nil){
                    print(String(data: data!, encoding: .utf8)!)
                    if let result = try? decoder.decode(Forecast.self, from: data!){
                        print(result)
                        onSuccess(result)}
                }else{
                    print(error!)
                }
            }
        }
        task.resume()
    }
    
}
