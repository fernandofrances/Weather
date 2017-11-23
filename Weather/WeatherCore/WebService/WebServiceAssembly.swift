//
//  WebServiceAssembly.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

final class WebServiceAssembly {
    private(set) lazy var webService = WebService(configuration: .default)
}
