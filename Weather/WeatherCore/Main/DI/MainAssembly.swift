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
    
    init(webServiceAssembly: WebServiceAssembly){
        self.webServiceAssembly = webServiceAssembly
    }
    
    public func viewController() -> MainViewController {
        return MainViewController(presenter: presenter())
    }
    
    func presenter() -> MainPresenter {
        return MainPresenter(repository: repository())
    }
    
    func repository() -> MainRepository {
        return MainRepository(webService: webServiceAssembly.webService)
    }
}
