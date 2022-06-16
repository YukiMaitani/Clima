//
//  WeatherManager.swift
//  Clima
//
//  Created by 米谷裕輝 on 2022/06/16.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=84312dda19abf8d279244b325d934bbd&units=metric"
    func fetchWeather(cityName: String) {
        let urlString = "\(url)&q=\(cityName)"
        peformResult(urlString: urlString)
    }
    
    func peformResult(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(weatherData:Data){
        let decorder = JSONDecoder()
        do{
            let decodedData = try decorder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let tempareture = decodedData.main.temp
            let weatherModel = WeatherModel(weatherID: id, name: name, tempareture: tempareture)
            print(weatherModel.temparetureString)
        } catch {
            print(error)
        }
    }
}
