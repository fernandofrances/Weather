//
//  MainViewController.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherName: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    
    private let presenter: MainPresenter
    private let searchBar = UISearchBar()
    
    init(presenter: MainPresenter){
        self.presenter = presenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.didLoad()
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        
    }
    
   

}

extension MainViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.loadForecast(city: searchBar.text ?? "")
    }

}

extension MainViewController: MainView {
    func update(with forecast: Forecast) {
        weatherName.text = forecast.name
        weatherDescription.text = "\(forecast.weather[0].main): \(forecast.weather[0].description)"
    }
    
    func update(with image: UIImage) {
        weatherIcon.image = image
    }
}
