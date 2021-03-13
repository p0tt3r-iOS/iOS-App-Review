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
                print("city set")
            }
        }
    }
    
    func getWeatherString(of state: Int) -> String? {
        switch state {
        case 10:
            return "맑음"
        case 11:
            return "구름"
        case 12:
            return "비"
        case 13:
            return "눈"
        default:
            return "맑음"
        }
    }
    
    func getImage(of state: Int) -> UIImage? {
        switch state {
        case 10:
            return UIImage(named: "sunny")
        case 11:
            return UIImage(named: "cloudy")
        case 12:
            return UIImage(named: "rainy")
        case 13:
            return UIImage(named: "snowy")
        default:
            return UIImage(named: "sunny")
        }
    }
    
}
