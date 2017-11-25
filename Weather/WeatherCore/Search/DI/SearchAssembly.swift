//
//  SearchAssembly.swift
//  Weather
//
//  Created by Fernando Frances on 24/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

final class SearchAssembly {
    
    func searchNavigator() -> SearchNavigator {
        return SearchNavigator(viewControllerProvider: self)
    }
    
    func presenter() -> LastSearchPresenter {
        return LastSearchPresenter()
    }
    
}

extension SearchAssembly: SearchViewControllerProvider {
    func searchViewController() -> LastSearchViewController {
        return LastSearchViewController(presenter: presenter())
    }
}
