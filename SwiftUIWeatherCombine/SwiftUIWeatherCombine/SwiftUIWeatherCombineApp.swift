//
//  SwiftUIWeatherCombineApp.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/13.
//

import SwiftUI

@main
struct SwiftUIWeatherCombineApp: App {
   
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    init() {
        self.viewModel = viewModel
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
