//
//  CardStackView.swift
//  TinderClone
//
//  Created by Imam Robani on 20/03/24.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardsViewModel(service: CardService())
    
    var body: some View {
        ZStack {
            ForEach(viewModel.cardModels) { card in
                CardView(viewModel: viewModel, model: card)
            }
        }
        .onChange(of: viewModel.cardModels) { oldValue, newValue in
            print("DEBUG: Old Value count is \(oldValue.count)")
            print("DEBUG: New Value count is \(newValue.count)")
        }
    }
}

#Preview {
    CardStackView()
}
