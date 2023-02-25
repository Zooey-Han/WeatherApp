//
//  AppError.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/15.
//

import Foundation

struct AppError: Identifiable {
    let id = UUID().uuidString
    let errorString: String
}
