//
//  ImageRepository.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

final class ImageRepository {
    private let webService: WebService
    init(webService: WebService){
        self.webService = webService
    }
    
    func image(icon: String, onImage: @escaping (UIImage)->Void){
        webService.loadImage(from: .imageForForecast(icon: icon)) { (image: UIImage) in
            onImage(image)
        }
    }
}
