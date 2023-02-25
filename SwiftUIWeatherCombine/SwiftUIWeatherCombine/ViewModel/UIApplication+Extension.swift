//
//  UIApplication+Extension.swift
//  SwiftUIWeatherCombine
//
//  Created by zooey on 2023/01/15.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
