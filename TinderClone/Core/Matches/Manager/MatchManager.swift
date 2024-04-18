//
//  MatchManager.swift
//  TinderClone
//
//  Created by Imam Robani on 18/04/24.
//

import Foundation

@MainActor
class MatchManager: ObservableObject {
    @Published var matchUser: User?
    
    func checkForMatch(withUser user: User) {
        let didMatch = Bool.random()
        
        if didMatch {
            matchUser = user
        }
    }
}
