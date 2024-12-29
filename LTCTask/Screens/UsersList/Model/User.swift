//
//  User.swift
//  LTCTask
//
//  Created by Ganesh Guturi on 26/12/24.
//

import Foundation

struct User: Identifiable, Hashable {    
    let id: Int
    let name: String
    let avatarURL: String
    
    var displayableName: String {
        return name.prefix(1).capitalized + name.dropFirst()
    }
}
