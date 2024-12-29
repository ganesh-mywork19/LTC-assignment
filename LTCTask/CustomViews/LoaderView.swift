//
//  LoaderView.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import SwiftUI

struct LoaderView: View {    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .green))
            .scaleEffect(2.0, anchor: .center)
    }
}
