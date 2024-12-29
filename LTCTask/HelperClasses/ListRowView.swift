//
//  ListRowView.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 28/12/24.
//

import SwiftUI

struct ListRowView: View {
    private(set) var title: String
    private(set) var imageURL: URL? //If an imageURL is nil then default placeholder will be shown.
    private(set) var spacing: CGFloat

    init(title: String, imageURL: URL?, spacing: CGFloat = 15.0) {
        self.title = title
        self.imageURL = imageURL
        self.spacing = spacing
    }
    
    var body: some View {
        HStack(spacing: spacing) {
            AvatarView(
                imageURL
            )
            Text(title)
                .font(.title3)
                .foregroundColor(.primaryTextColor)
        }
    }
}
