//
//  CardModel.swift
//  TinderClone
//
//  Created by Imam Robani on 22/03/24.
//

import Foundation

struct CardModel {
    let user: User
}

extension CardModel: Identifiable {
    var id: String { return user.id}
}
