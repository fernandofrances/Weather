//
//  LastSearchViewController.swift
//  Weather
//
//  Created by Fernando Frances on 24/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

protocol SearchViewControllerProvider: class {
    func searchViewController() -> LastSearchViewController
}

class LastSearchViewController: UITableViewController {
    
    private let presenter : LastSearchPresenter
    private var lastSearchedCities: [String]?
    
    init(presenter: LastSearchPresenter){
        self.presenter = presenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        presenter.view = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter.didLoad()
    }
 
    //MARK: - Tableview DataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Last Searched"
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return lastSearchedCities?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = lastSearchedCities?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = city
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let city = lastSearchedCities?[indexPath.row]
        presenter.didSelect(city: city!)
    }
}

extension LastSearchViewController: LastSearchView {
    func update(with cities: [String]) {
        lastSearchedCities = cities
        tableView.reloadData()
    }
    
    func dismissSearch(with city: String) {
        self.dismiss(animated: true) {
            NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "citySelected"), object: city, userInfo:nil))
        }
    }
}

extension LastSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // Update the search query as the user types
    }
}

extension LastSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       //Save the text of the search to last searched cities in userDefaults
        if var lastSearched = UserDefaults.standard.stringArray(forKey: "lastSearched"){
            lastSearched.insert(searchBar.text ?? "", at: 0)
            UserDefaults.standard.set(lastSearched, forKey: "lastSearched")
        }else{
            let array = [searchBar.text ?? ""]
            UserDefaults.standard.set(array, forKey: "lastSearched")
        }
        print("Defaults: \(UserDefaults.standard.stringArray(forKey: "lastSearched") ?? ["no defaults"])")
        self.dismissSearch(with: searchBar.text ?? "")
    }
}

