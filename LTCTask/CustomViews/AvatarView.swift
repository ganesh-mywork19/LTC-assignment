//
//  AvatarView.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import SwiftUI

struct AvatarView: View {
    ///If an imageURL is nil then default placeholder will be shown.
    private(set) var imageURL: URL?
    private(set) var size: CGFloat
    
    init(_ imageURL: URL? = nil, size: CGFloat = min(UIScreen.width * 0.15, 60)) {
        self.imageURL = imageURL
        self.size = size
    }
    
    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Image(systemName: "photo.fill")
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.white, lineWidth: 3)
                .frame(width: size, height: size)
        )
        .shadow(radius: 6)
    }
}
