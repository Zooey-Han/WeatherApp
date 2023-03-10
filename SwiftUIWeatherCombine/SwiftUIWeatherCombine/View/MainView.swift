//
//  MainView.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/13.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var forecastList: ForecastListViewModel = ForecastListViewModel()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(.systemGray3)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        TextField("Enter Location", text: $forecastList.location) {
                            forecastList.getWeatherForecast()
                        }
                        Button {
                            forecastList.getWeatherForecast()
                            forecastList.location = ""
                        } label: {
                            Image(systemName: "magnifyingglass.circle.fill")
                        }
                    }
                    .padding(.horizontal)
                    
                    ScrollView(showsIndicators: false) {
                        
                        ForEach(forecastList.forecastArray, id: \.city.id) { forcast in
                            NavigationButtonView(forecast: forcast)
                        }
                    }
                }
            }
            .alert(item: $forecastList.appError) { appAlert in
                Alert(title: Text("Error"),
                      message: Text("""
                    \(appAlert.errorString)
                    Please try again later
                    """
                                   )
                )
            }
        }
        .fontDesign(.monospaced)
        .accentColor(.black)
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(forecastList: ForecastListViewModel())
    }
}
