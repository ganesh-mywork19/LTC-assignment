//
//  LTCTaskApp.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import SwiftUI

@main
struct LTCTaskApp: App {
    var body: some Scene {
        WindowGroup {
            UserDirectoryView(
                viewModel: UserDirectoryViewModel(
                    service: APIServiceManager()
                )
            )
        }
    }
}
