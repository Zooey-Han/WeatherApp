//
//  ViewModel.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/14.
//

import Foundation
import CoreLocation

class ViewModel: ObservableObject {
    
    @Published var location: String = ""
    @Published var forecastArray: [Forecast] = []
    
    
    
    func getWeatherForecast(for location: String) {
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
                        self.forecastArray.append(forecast)
//                        for list in forecast.list {
//                            print(dateFormatter.string(from: list.dt))
//                            print("   최고: ", list.main.temp_max)
//                            print("   최저: ", list.main.temp_min)
//                            print("   습도: ", list.main.humidity)
//                            print("   기압: ", list.main.pressure)
//                            print("   온도: ", list.main.temp)
//                            print("   오늘기온설명: ", list.weather[0].main)
//                            print("   오늘기온간단하게설명: ", list.weather[0].description)
//                            print("   아이콘: ", list.weather[0].weatherIconURL)
//                            print("   흐림정도: ", list.clouds.all)
//                            print("   바람세기: ", list.wind.speed)
//                            print("   가시거리: ", list.visibility)
//                            print("   강수확률: ", list.pop)
//                        }
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
