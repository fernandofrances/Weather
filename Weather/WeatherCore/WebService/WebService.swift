//
//  WebService.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

final internal class WebService {
    private let configuration: WebServiceConfiguration
    private let session = URLSession(configuration: .default)
    private let baseURL = URL(string: "http://api.openweathermap.org")!
    private let decoder = JSONDecoder()
    
    init(configuration : WebServiceConfiguration){
        self.configuration = configuration
    }
    
    func load(from endpoint: Endpoint, onSuccess: @escaping (Forecast) -> Void, onError: @escaping (Error) -> Void, onWrongSearch: @escaping () -> Void) {
        let decoder = self.decoder
        let request = endpoint.request(with: baseURL, adding: configuration.paramenters)
        let task = session.dataTask(with: request.url!){ (data: Data?, response: URLResponse?, error: Error?) in
            OperationQueue.main.addOperation {
                if(error == nil){
                    if let result = try? decoder.decode(Forecast.self, from: data!){
                        onSuccess(result)
                    }else{
                        onWrongSearch()
                    }
                }else{
                    onError(error!)
                }
            }
        }
        task.resume()
    }
    
    func loadImage(from endpoint: Endpoint, onSuccess: @escaping (UIImage) -> Void){
        let request = endpoint.request(with: baseURL, adding: [:])
        let queue = OperationQueue()
        queue.addOperation {
            if let url = request.url,
               let data = NSData(contentsOf: url),
               let image = UIImage(data: data as Data){
                OperationQueue.main.addOperation {
                    onSuccess(image)
                }
            }
        }
    }
    
}
