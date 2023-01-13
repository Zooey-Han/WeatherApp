//
//  MainView.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/13.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        ZStack {
            Color(.systemGray3)
                .ignoresSafeArea()
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
