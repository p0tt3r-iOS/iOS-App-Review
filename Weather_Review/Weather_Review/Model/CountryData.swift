//
//  Country.swift
//  Weather_Review
//
//  Created by 하동훈 on 2021/03/13.
//

import Foundation

struct Country: Codable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}

struct City: Codable {
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case state, celsius
        case rainfallProbability = "rainfall_probability"
    }
    
    var fahrenheit: String {
        return String(format: "%.1f", celsius * 1.8 + 32)
    }
    var degree: String {
        return "섭씨 \(celsius)도 / 화씨 \(fahrenheit)도"
    }
    var probabilityString: String {
        return "강수확률 \(rainfallProbability)%"
    }
    
    
}
