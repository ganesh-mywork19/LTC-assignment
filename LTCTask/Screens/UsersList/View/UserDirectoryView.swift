//
//  UserDirectoryView.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import SwiftUI

struct UserDirectoryView: View {
    private(set) var viewModel: UserDirectoryViewModel
    
    /// Dependency Injection
    /// - Parameter viewModel: The ViewModel that belongs to current view and which needs to be passed from outside.
    init(viewModel: UserDirectoryViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(viewModel.users) { user in
                    ListRowView(
                        title: user.displayableName,
                        imageURL: URL(string: user.avatarURL)
                    )
                }
                .listStyle(PlainListStyle())

                if viewModel.showLoader {
                    LoaderView()
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(AppConstants.screenTitle)
            .navigationBarBgColor()
            .alert(
                isPresented: .constant(viewModel.showAlert),
                title: AppConstants.errorTitle,
                message: viewModel.errorMessage,
                dismissButtonTitle: AppConstants.Action.ok,
                dismissButtonAction: {
                    viewModel.dismissAlert()
                }
            )
        }
        .task {
            await viewModel.fetchUsers() //fetch API call
        }
    }
}

