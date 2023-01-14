//
//  DetailView.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/13.
//
//http://openweathermap.org/img/wn/10d@2x.png

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    var forecast: Forecast
    
    var body: some View {
        
        VStack(spacing: 30) {
            VStack {
                Text("\(forecast.city.name)")
                    .font(.title)
                WebImage(url: forecast.list[0].weather[0].weatherIconURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                HStack(spacing: 40) {
                    Text("▼ \(ForecastViewModel.numberFormatter.string(for: forecast.list[0].main.temp_min)!)°")
                    Text("\(ForecastViewModel.numberFormatter.string(for: forecast.list[0].main.temp)!)°")
                        .font(.title)
                    Text("▲ \(ForecastViewModel.numberFormatter.string(for: forecast.list[0].main.temp_max)!)°")
                }
                
                HStack(spacing: 130) {
                    
                    VStack {
                        Text("Sunrise")
                        Text("\(forecast.city.sunrise, formatter: ForecastViewModel.dateFormatter)")
                    }
                    
                    VStack {
                        Text("Sunset")
                        Text("\(forecast.city.sunset, formatter: ForecastViewModel.dateFormatter)")
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(forecast.list, id: \.dt) { list in
                            VStack(spacing: 10) {
                                Text("\(list.dt, formatter: ForecastViewModel.dateFormatter)")
                                WebImage(url: forecast.list[0].weather[0].weatherIconURL)
                                HStack(spacing: 3) {
                                    Text("\(ForecastViewModel.numberFormatter.string(for: forecast.list[0].main.temp_min)!)°")
                                        .foregroundColor(.white)
                                    Text("\(ForecastViewModel.numberFormatter.string(for: forecast.list[0].main.temp_max)!)°")
                                }
                            }
                            .padding()
                        }
                    }
                }
                .padding()
                
                ScrollView {
                    
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Discription")
                                Text("\(forecast.list[0].weather[0].description)")
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Weather  ")
                                Text("\(forecast.list[0].weather[0].main)")
                            }
                        }
                        
                        Divider()
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Chance of Rain")
                                Text("\(ForecastViewModel.numberFormatter.string(for: forecast.list[0].pop)!) %")
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Humidity ")
                                Text("\(ForecastViewModel.numberFormatter.string(for: forecast.list[0].main.humidity)!) %")
                            }
                        }
                        
                        Divider()
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("visibility")
                                Text("\(forecast.list[0].visibility) mi")
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Pressure ")
                                Text("\(forecast.list[0].main.pressure) hpa")
                            }
                        }
                        
                        Divider()
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Wind")
                                Text("\(String(format: "%.2f", forecast.list[0].wind.speed)) mm")
                            }
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("Clouds   ")
                                Text("\(forecast.list[0].clouds.all) %")
                            }
                        }
                    }
                    .font(.callout)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                }
            }
        }
        .fontDesign(.monospaced)
        .background {
            Color(.systemGray2)
                .ignoresSafeArea()
        }
    }
}
