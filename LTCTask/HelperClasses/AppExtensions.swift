//
//  AppExtensions.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import Foundation
import UIKit
import SwiftUI

//MARK: To set NavigationBar background color
extension View {
    
    func navigationBarBgColor(_ background: Color = .themeColor) -> some View {
        self.modifier(NavigationBarModifier(background: background))
    }
}

//MARK: for Alert
extension View {
    
    func alert(isPresented: Binding<Bool>,
               title: String,
               message: String,
               dismissButtonTitle: String = "Ok",
               dismissButtonAction: (() -> Void)? = nil) -> some View {
        self.modifier(AlertModifier(
            isPresented: isPresented,
            title: title,
            message: message,
            dismissButtonTitle: dismissButtonTitle,
            dismissButtonAction: dismissButtonAction
        ))
    }
}

extension URLResponse {
    
    func isValidResponse() -> Bool {
        statusCode() == 200
    }
    
    func statusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}

//MARK: for Screen size
extension UIScreen {
    
    static var width: CGFloat {
        self.main.bounds.size.width
    }
    
    static var height: CGFloat {
        self.main.bounds.size.height
    }
}

extension Color {
    static let themeColor = Color.green
    static let primaryTextColor = Color.black
}
