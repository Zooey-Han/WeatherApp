//
//  ForecastListViewModel.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/14.
//

import Foundation
import CoreLocation

class ForecastListViewModel: ObservableObject {
    
    @Published var forecastArray: [Forecast] = []
    
    var location: String = ""
    
    func getWeatherForecast() {
        let apiService = APIService.shared
        
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let lat = placemarks?.first?.location?.coordinate.latitude,
               let lon = placemarks?.first?.location?.coordinate.longitude {
                apiService.getJSON(urlString: "http://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=54bff87b9c05c8c77315a573612ac04b&units=metric", dateDecodingStarategy: .secondsSince1970) { (result: Result<Forecast, APIService.APIError>) in
                    switch result {
                    case .success(let forecast):
                        DispatchQueue.main.async {
                            self.forecastArray.append(forecast)
                        }
                    case .failure(let apiError):
                        switch apiError {
                        case .error(let errorString):
                            print(errorString)
                        }
                    }
                }
            }
        }
    }
}
