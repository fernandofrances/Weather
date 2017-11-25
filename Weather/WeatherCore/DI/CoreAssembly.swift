//
//  CoreAssembly.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

final class CoreAssembly {

    private(set) lazy var webServiceAssembly = WebServiceAssembly()
    private(set) lazy var searchAssembly = SearchAssembly()
    public lazy var mainAssembly = MainAssembly(webServiceAssembly: webServiceAssembly, searchAssembly: searchAssembly)
    private let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
}
