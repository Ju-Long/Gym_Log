//
//  User.swift
//  Gym Log
//
//  Created by Ju Long on 9/2/21.
//

import Foundation
struct User: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var username: String
}
