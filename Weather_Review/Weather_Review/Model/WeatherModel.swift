//
//  WeatherModel.swift
//  Weather_Review
//
//  Created by 하동훈 on 2021/03/13.
//

import UIKit

class WeatherModel {
    static var shared = WeatherModel()
    
    var countries = [Country]()
    var country: Country? = nil
    var cities: [City]? = nil
    var city: City? = nil

    
    func setCountry(of countryName: String) {
        for country in countries {
            if countryName == country.koreanName {
                self.country = country
            }
        }
    }
    
    func setCity(of cityName: String) {
        guard let cities = cities else { return }
        for city in cities {
            if cityName == city.cityName {
                self.city = city
            }
        }
    }
    
}
