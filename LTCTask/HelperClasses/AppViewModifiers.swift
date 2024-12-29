//
//  AppViewModifiers.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 27/12/24.
//

import SwiftUI

/// To have all View Modifiers here
struct NavigationBarModifier: ViewModifier {
    var background: Color
    
    func body(content: Content) -> some View {
        content
            .toolbarBackground(
                background,
                for: .navigationBar
            )
            .toolbarBackground(
                .visible,
                for: .navigationBar
            )
    }
}

struct AlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    var title: String
    var message: String
    var dismissButtonTitle: String
    var dismissButtonAction: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .alert(isPresented: $isPresented) {
                return Alert(
                    title: Text(title),
                    message: Text(message),
                    dismissButton: .default(
                        Text(dismissButtonTitle),
                        action: dismissButtonAction
                    )
                )
            }
    }
}
