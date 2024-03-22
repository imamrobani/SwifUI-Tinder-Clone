//
//  CardsViewModel.swift
//  TinderClone
//
//  Created by Imam Robani on 22/03/24.
//

import Foundation

class CardsViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    
    private let service: CardService
    
    init(service: CardService) {
        self.service = service
        Task { await fetchCardModels() }
    }
    
    func fetchCardModels() async {
        do {
            self.cardModels = try await service.fetchCardModel()
        } catch {
            print("DEBUG: failed to fetch cards with error: \(error)")
        }
    }
}
