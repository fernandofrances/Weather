//
//  ImageLoadingAssembly.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

final class ImageLoadingAssembly {
    private(set) lazy var imageRepository = ImageRepository(webService: webServiceAssembly.webService)
    private let webServiceAssembly: WebServiceAssembly
    init(webServiceAssembly:WebServiceAssembly){
        self.webServiceAssembly = webServiceAssembly
    }
}
