//
//  SearchNavigator.swift
//  Weather
//
//  Created by Fernando Frances on 24/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

final class SearchNavigator {
    private let viewControllerProvider: SearchViewControllerProvider
    private var searchController: UISearchController!
    
    init(viewControllerProvider: SearchViewControllerProvider) {
        self.viewControllerProvider = viewControllerProvider
    }
    
    func installSearch(viewController: UIViewController) {
        let lastSearchViewController = viewControllerProvider.searchViewController()
        searchController = UISearchController(searchResultsController: lastSearchViewController)
        
        searchController.searchResultsUpdater = lastSearchViewController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("Search City", comment: "")
        searchController.searchBar.searchBarStyle = .minimal
        
        searchController.searchBar.delegate = (lastSearchViewController as! UISearchBarDelegate)
        viewController.navigationItem.titleView = searchController.searchBar
        viewController.definesPresentationContext = true
    }
}
