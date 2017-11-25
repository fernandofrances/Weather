//
//  MainAssembly.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

final class MainAssembly {
    private let webServiceAssembly: WebServiceAssembly
    private let searchAssembly: SearchAssembly
    
    init(webServiceAssembly: WebServiceAssembly, searchAssembly: SearchAssembly){
        self.webServiceAssembly = webServiceAssembly
        self.searchAssembly = searchAssembly
    }
    
    public func viewController() -> MainViewController {
        return MainViewController(presenter: presenter(),searchNavigator: searchNavigator())
    }
    
    func presenter() -> MainPresenter {
        return MainPresenter(repository: repository(),imageRepository: imageRepository())
    }
    
    func repository() -> MainRepository {
        return MainRepository(webService: webServiceAssembly.webService)
    }
    
    func searchNavigator() -> SearchNavigator {
        return searchAssembly.searchNavigator()
    }
    
    func imageRepository() -> ImageRepository {
        return ImageRepository(webService: webServiceAssembly.webService)
    }
}
