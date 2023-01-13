//
//  DetailView.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/13.
//
//http://openweathermap.org/img/wn/10d@2x.png

import SwiftUI

struct DetailView: View {
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Seoul")
                .font(.title)
            Image(systemName: "sun.max")
                .font(.system(size: 130))
            HStack(spacing: 40) {
                Text("▼ 24°")
                Text("30°")
                    .font(.largeTitle)
                Text("▲ 34°")
            }
            
            HStack(spacing: 130) {
                
                VStack {
                    Text("Sunrise")
                    Text("07:00")
                }
                
                VStack {
                    Text("Sunset")
                    Text("19:18")
                }
            }
            .padding()
            
            // daily
            ScrollView(.horizontal) {
                VStack(spacing: 10) {
                    Text("WED")
                    Image(systemName: "sun.max")
                    HStack(spacing: 3) {
                        Text("24°")
                            .foregroundColor(.white)
                        Text("34°")
                    }
                }
            }
            .padding()
            
            // current
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Feel Like")
                            Text("34°")
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Humidity")
                            Text("89 %")
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Clouds")
                            Text("50 %")
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("DewPoint")
                            Text("16°")
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Wind")
                            Text("0 mm")
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Pressure")
                            Text("1009 hpa")
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("visibility")
                            Text("1.5mi")
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("UV Index")
                            Text("0")
                        }
                    }
                }
                .font(.callout)
                .padding(.leading, 40)
                .padding(.trailing, 40)
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
        DetailView()
    }
}
