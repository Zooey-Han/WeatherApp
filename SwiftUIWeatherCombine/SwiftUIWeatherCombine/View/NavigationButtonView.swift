//
//  NavigationButtonView.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/15.
//

import SwiftUI

struct NavigationButtonView: View {
    
    var forecast: Forecast
    
    static let dateformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    var body: some View {
        
        NavigationLink {
            DetailView(forecast: forecast)
        } label: {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(forecast.city.name)")
                    .font(.title)
                
                HStack(spacing: 100) {
                    Text("\(forecast.city.timezone, formatter: NavigationButtonView.dateformat)")
                    Image(systemName: "sun.max")
                        .font(.largeTitle)
                    Text("\(String(format: "%.0f", forecast.list[0].main.temp))°")
                }
            }
            .frame(height: UIScreen.main.bounds.height / 6)
            .frame(maxWidth: UIScreen.main.bounds.width)
            .background{
                Color(.systemGray2)
            }
        }
    }
}

struct NavigationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
