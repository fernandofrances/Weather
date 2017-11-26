//
//  MainPresenter.swift
//  Weather
//
//  Created by Fernando Frances on 23/11/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

protocol MainView: class {
    func update(with forecast: Forecast)
    func update(with image: UIImage)
    func searchStarted()
    func conectionError()
    func wrongSearch()
}

final class MainPresenter {
    private let repository: MainRepository
    private let imageRepository: ImageRepository
    weak var view: MainView?
    
    init(repository: MainRepository, imageRepository: ImageRepository){
        self.repository = repository
        self.imageRepository = imageRepository
    }
    
    func didLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.notificationFromSearch(notification:)), name: NSNotification.Name(rawValue: "citySelected"), object: nil)
    }
    
}

extension MainPresenter {
    
    @objc func notificationFromSearch(notification: Notification){
        self.view?.searchStarted()
        let city = notification.object as! String
        loadForecast(city: city)
    }
    
    func loadForecast(city: String) {
        repository.forecastForCity(city: city, onResults: { (forecast: Forecast) in
            self.saveCityInUserDefaults(city: city)
            self.view?.update(with: forecast)
            self.imageRepository.image(icon: forecast.weather[0].icon, onImage: { (image: UIImage) in
                self.view?.update(with: image)})
        }, onError: { (error: Error?) in
            self.view?.conectionError()
        }) {
            self.view?.wrongSearch()
        }
    }
    
    func saveCityInUserDefaults(city: String){
        //Save the text of the search to last searched cities in userDefaults
        let userDefaults = UserDefaults.standard
        if var lastSearched = userDefaults.stringArray(forKey: "lastSearched"){
            lastSearched.insert(city, at: 0)
            userDefaults.set(lastSearched, forKey: "lastSearched")
        }else{
            let array = [city]
            userDefaults.set(array, forKey: "lastSearched")
        }
    }
}

