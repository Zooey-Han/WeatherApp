//
//  ForecastListViewModel.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/14.
//

import Foundation
import CoreLocation
import SwiftUI

class ForecastListViewModel: ObservableObject {
    
    @Published var forecastArray: [Forecast] = []
    var appError: AppError? = nil
    @Published var location: String = ""
    
    func getWeatherForecast() {
        UIApplication.shared.endEditiong()
        let apiService = APIServiceCombine.shared
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if let error = error as? CLError {
                switch error.code {
                case .locationUnknown, .geocodeFoundNoResult, .geocodeFoundPartialResult:
                    self.appError = AppError(errorString: NSLocalizedString("Unable to determine location from this text.", comment: ""))
                case .network:
                    self.appError = AppError(errorString: NSLocalizedString("You do not appear to have a network connection.", comment: ""))
                default:
                    self.appError = AppError(errorString: error.localizedDescription)
                }
                print(error.localizedDescription)
            }
            if let lat = placemarks?.first?.location?.coordinate.latitude,
               let lon = placemarks?.first?.location?.coordinate.longitude {
                apiService.getJSON(urlString: "http://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=54bff87b9c05c8c77315a573612ac04b&units=metric", dateDecodingStarategy: .secondsSince1970) { (result: Result<Forecast, APIServiceCombine.APIError>) in
                    switch result {
                    case .success(let forecast):
                        DispatchQueue.main.async {
                            self.forecastArray.append(forecast)
                        }
                    case .failure(let apiError):
                        switch apiError {
                        case .error(let errorString):
                            self.appError = AppError(errorString: errorString)
                            print(errorString)
                        }
                    }
                }
            }
        }
    }
}
