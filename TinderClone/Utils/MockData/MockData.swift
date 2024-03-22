//
//  MockData.swift
//  TinderClone
//
//  Created by Imam Robani on 22/03/24.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullname: "Megan Fox",
            age: 37,
            profileImageUrls: ["megan-fox-1", "megan-fox-2"]
        ),
        .init(
            id: NSUUID().uuidString,
            fullname: "Jisoo Black Pink",
            age: 25,
            profileImageUrls: ["jisoo-black-pink-2", "jisoo-black-pink-3"]
        ),
        .init(
            id: NSUUID().uuidString,
            fullname: "Lisa Black Pink",
            age: 27,
            profileImageUrls: [ "lisa-black-pink-1", "lisa-black-pink-2", "lisa-black-pink-3"]
        ),
    ]
}
