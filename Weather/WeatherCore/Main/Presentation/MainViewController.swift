//
//  MainViewController.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherName: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    
    private let presenter: MainPresenter
    private let searchNavigator: SearchNavigator
    
    init(presenter: MainPresenter, searchNavigator: SearchNavigator){
        self.presenter = presenter
        self.searchNavigator = searchNavigator
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.didLoad()
        searchNavigator.installSearch(viewController: self)
    }

}


extension MainViewController: MainView {
    func update(with forecast: Forecast) {
        weatherName.text = forecast.name
        weatherDescription.text = "\(forecast.weather[0].main) - \(forecast.weather[0].description)"
        temperature.text = ("Temperature: \(Float(forecast.main.temp))ºC ")
        maxTemperature.text = ("Max Temperature: \(Float(forecast.main.temp_max))ºC")
        minTemperature.text = ("Min Temperature: \(Float(forecast.main.temp_min))ºC")
        humidity.text = ("Humidity: \(Int(forecast.main.humidity))%")
        pressure.text = ("Pressure: \(Int(forecast.main.pressure)) Bar")
        windSpeed.text = ("Wind Speed: \(Int(forecast.wind.speed))km/h")
        infoView.isHidden = false
    }
    
    func update(with image: UIImage) {
        weatherIcon.image = image
    }
}
