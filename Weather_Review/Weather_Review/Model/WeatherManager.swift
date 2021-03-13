//
//  WeatherManager.swift
//  Weather_Review
//
//  Created by 하동훈 on 2021/03/13.
//

import UIKit

struct WeatherManager {
    
    var weatherModel = WeatherModel.shared
    
    mutating func parseCountryJSON() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        do {
            self.weatherModel.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error)
        }
    }
    
    mutating func parseCityJSON() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        if let assetName = weatherModel.country?.assetName {
            guard let dataAsset: NSDataAsset = NSDataAsset(name: assetName) else {
                return
            }
            do {
                self.weatherModel.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
            } catch {
                print(error)
            }
        }
    }
}
