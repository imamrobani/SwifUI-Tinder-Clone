//
//  User.swift
//  TinderClone
//
//  Created by Imam Robani on 22/03/24.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let fullname: String
    var age: Int
    var profileImageUrls: [String]
}
