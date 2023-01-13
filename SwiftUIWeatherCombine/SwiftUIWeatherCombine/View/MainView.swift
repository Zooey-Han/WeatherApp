//
//  MainView.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/13.
//

import SwiftUI
import CoreLocation

struct MainView: View {
    
    @State private var location: String = ""
    
    var body: some View {
        
        ZStack {
            Color(.systemGray3)
                .ignoresSafeArea()
            VStack {
                HStack {
                    TextField("Enter Location", text: $location)
                    Button {
                        getWeatherForecast(for: location)
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                    }
                }
                .padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Seoul")
                            .font(.title)
                        
                        HStack(spacing: 80) {
                            Text("11:10")
                            Image(systemName: "sun.max")
                                .font(.largeTitle)
                            Text("30°")
                        }
                    }
                    .fontDesign(.monospaced)
                    .frame(height: UIScreen.main.bounds.height / 6)
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .background{
                        Color(.systemGray2)
                    }
                }
            }
        }
    }
    func getWeatherForecast(for location: String) {
        let apiService = APIService.shared
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let lat = placemarks?.first?.location?.coordinate.latitude,
               let lon = placemarks?.first?.location?.coordinate.longitude {
                apiService.getJSON(urlString: "http://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=54bff87b9c05c8c77315a573612ac04b&units=metric", dateDecodingStarategy: .secondsSince1970) { (result: Result<Forecast, APIService.APIError>) in
                    switch result {
                    case .success(let forecast):
                        for list in forecast.list {
                            print(dateFormatter.string(from: list.dt))
                            print("   최고: ", list.main.temp_max)
                            print("   최저: ", list.main.temp_min)
                            print("   습도: ", list.main.humidity)
                            print("   기압: ", list.main.pressure)
                            print("   온도: ", list.main.temp)
                            print("   오늘기온설명: ", list.weather[0].main)
                            print("   오늘기온간단하게설명: ", list.weather[0].description)
                            print("   아이콘: ", list.weather[0].weatherIconURL)
                            print("   흐림정도: ", list.clouds.all)
                            print("   바람세기: ", list.wind.speed)
                            print("   가시거리: ", list.visibility)
                            print("   강수확률: ", list.pop)
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
