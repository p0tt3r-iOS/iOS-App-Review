//
//  Selction.swift
//  Weather_Review
//
//  Created by 하동훈 on 2021/03/13.
//

import Foundation

class Selection {
    static var shared = Selection()
    
    var Country: Country? = nil {
        willSet {
            guard let new: Country = newValue else { return }
            print("City: \(new.koreanName)를 선택했습니다.")
        }
    }
    
    var city: City? = nil {
        willSet {
            guard let new: City = newValue else { return }
            print("City: \(new.cityName)를 선택했습니다.")
        }
    }
}
