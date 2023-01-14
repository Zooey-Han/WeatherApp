//
//  DetailView.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/13.
//
//http://openweathermap.org/img/wn/10d@2x.png

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: ViewModel
    var location: String
    
    var body: some View {
        
        VStack(spacing: 20) {
            VStack {
                if let forecast = viewModel.forecast {
                    
                    Text("\(forecast.city.name)")
                        .font(.title)
                    Image(systemName: "sun.max")
                        .font(.system(size: 130))
                    HStack(spacing: 40) {
                        Text("▼ \(String(format: "%.0f", forecast.list[0].main.temp_min))°")
                        Text("\(String(format: "%.0f", forecast.list[0].main.temp))°")
                            .font(.largeTitle)
                        Text("▲ \(String(format: "%.0f", forecast.list[0].main.temp_max))°")
                    }
                    
                    HStack(spacing: 130) {
                        
                        VStack {
                            Text("Sunrise")
                            Text(viewModel.dateFormatter.string(from: forecast.city.sunrise))
                        }
                        
                        VStack {
                            Text("Sunset")
                            Text(viewModel.dateFormatter.string(from: forecast.city.sunset))
                            
                        }
                    }
                    .padding()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    if let forecast = viewModel.forecast {
                        HStack {
                            ForEach(forecast.list, id: \.dt) { list in
                                VStack(spacing: 10) {
                                    Text(viewModel.dateFormatter.string(from: list.dt))
                                    Image(systemName: "sun.max")
                                    HStack(spacing: 3) {
                                        Text("\(String(format: "%.0f", list.main.temp_min))°")
                                            .foregroundColor(.white)
                                        Text("\(String(format: "%.0f", list.main.temp_max))°")
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                
                ScrollView {
                    if let forecast = viewModel.forecast {
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Chance of Rain")
                                    Text("\(String(format: "%.0f", forecast.list[0].pop))%")
                                }
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("Humidity")
                                    Text("\(forecast.list[0].main.humidity) %")
                                }
                            }
                            
                            Divider()
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("visibility")
                                    Text("\(forecast.list[0].visibility)mi")
                                }
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("Pressure")
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
                                    Text("Clouds  ")
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
        }
        .fontDesign(.monospaced)
        .background {
            Color(.systemGray2)
                .ignoresSafeArea()
        }
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: ViewModel(), location: "")
    }
}
