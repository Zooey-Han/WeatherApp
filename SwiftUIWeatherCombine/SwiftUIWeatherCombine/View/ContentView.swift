//
//  ContentView.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/13.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                MainView(viewModel: viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
