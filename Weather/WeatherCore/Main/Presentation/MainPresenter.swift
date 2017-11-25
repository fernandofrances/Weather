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
        let city = notification.object as! String
        loadForecast(city: city)
    }
    
    func loadForecast(city: String) {
        repository.forecastForCity(city: city) { (forecast: Forecast) in
            self.view?.update(with: forecast)
            self.imageRepository.image(icon: forecast.weather[0].icon, onImage: { (image: UIImage) in
                self.view?.update(with: image)
            })
        }
    }
}

