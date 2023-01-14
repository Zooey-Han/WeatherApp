//
//  Weather.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/13.
//

import Foundation

struct Forecast: Codable, Hashable {
    static func == (lhs: Forecast, rhs: Forecast) -> Bool {
        return true
    }
    
    let list: [List]
    let city: City
}

struct List: Codable, Hashable {
    let dt: Date
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let sys: Sys
    let dt_txt: String
}

struct Main: Codable, Hashable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Weather: Codable, Hashable {
    let main: String
    let description: String
    let icon: String
    var weatherIconURL: URL {
        let urlString = "http://openweathermap.org/img/wn/\(icon)@2x.png"
        return URL(string: urlString)!
    }
}

struct Clouds: Codable, Hashable {
    let all : Int
}

struct Wind: Codable, Hashable {
    let speed: Double
}

struct Sys: Codable, Hashable {
    let pod: String
}

struct City: Codable, Hashable {
    let id: Int
    let name: String
    let country: String
    let timezone: Date
    let sunrise: Date
    let sunset: Date
}



//http://api.openweathermap.org/data/2.5/forecast?lat=37.4986&lon=126.8592&appid=54bff87b9c05c8c77315a573612ac04b&units=metric
