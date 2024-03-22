//
//  CardService.swift
//  TinderClone
//
//  Created by Imam Robani on 22/03/24.
//

import Foundation

struct CardService {
    func fetchCardModel() async throws -> [CardModel] {
        let users = MockData.users
        return users.map({ CardModel(user: $0) })
    }
}
