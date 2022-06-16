//
//  WeatherModel.swift
//  Clima
//
//  Created by 米谷裕輝 on 2022/06/16.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let weatherID: Int
    let name: String
    let tempareture: Double
    
    var conditionName: String {
        switch weatherID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
    var temparetureString: String {
        return String(format: "%.1f", tempareture)
    }
}
