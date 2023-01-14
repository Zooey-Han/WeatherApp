//
//  ForecastViewModel.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/15.
//

import Foundation

struct ForecastViewModel {
    
    let forecast: [Forecast]
    
    static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
    }
    
    static var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }
}
