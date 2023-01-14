//
//  MainView.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/13.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        
        ZStack {
            Color(.systemGray3)
                .ignoresSafeArea()
            VStack {
                HStack {
                    TextField("Enter Location", text: $viewModel.location)
                    Button {
                        viewModel.getWeatherForecast(for: viewModel.location)
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                    }
                }
                .padding(.horizontal)
                
                
                ScrollView(showsIndicators: false) {
                    
                    ForEach(viewModel.forecastArray, id: \.city.id) { forcast in
                        NavigationButtonView(forecast: forcast)
//                        NavigationLink {
//                            DetailView(viewModel: viewModel, location: viewModel.location)
//                        } label: {
//                            VStack(alignment: .leading, spacing: 20) {
//                                Text("\(list.city.name)")
//                                    .font(.title)
//
//                                HStack(spacing: 80) {
//                                    Text("\(viewModel.dateFormatter.string(from: list.city.timezone))")
//                                    Image(systemName: "sun.max")
//                                        .font(.largeTitle)
//                                    Text("\(list.list[0].main.temp)°")
//                                }
//                            }
//                            .frame(height: UIScreen.main.bounds.height / 6)
//                            .frame(maxWidth: UIScreen.main.bounds.width)
//                            .background{
//                                Color(.systemGray2)
//                            }
//                        }
                    }
                }
            }
        }
        .fontDesign(.monospaced)
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: ViewModel())
    }
}


struct NavigationButtonView: View {
    
    var forecast: Forecast
    
    var body: some View {
        
        
        VStack {
            NavigationLink {
                DetailView(forecast: forecast)
            } label: {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(forecast.city.name)")
                        .font(.title)
                    
                    HStack(spacing: 80) {
                        Text("\(forecast.city.timezone))")
                        Image(systemName: "sun.max")
                            .font(.largeTitle)
                        Text("\(forecast.list[0].main.temp)°")
                    }
                }
            }
        }
    }
}
