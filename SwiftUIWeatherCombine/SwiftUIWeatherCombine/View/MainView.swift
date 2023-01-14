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
        NavigationStack {
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
                        }
                    }
                }
            }
        }
        .fontDesign(.monospaced)
        .accentColor(.black)
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: ViewModel())
    }
}
