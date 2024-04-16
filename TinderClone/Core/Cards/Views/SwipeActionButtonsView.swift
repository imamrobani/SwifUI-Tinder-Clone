//
//  SwipeActionButtonsView.swift
//  TinderClone
//
//  Created by Imam Robani on 03/04/24.
//

import SwiftUI

struct SwipeActionButtonsView: View {
    @ObservedObject var viewModel: CardsViewModel
    
    var body: some View {
        HStack(spacing: 32) {
            Button {
                viewModel.buttonSwipeAction = .reject
            } label: {
                actionButton(name: "xmark", color: .red)
            }
            .frame(width: 48, height: 58)
            
            Button {
                viewModel.buttonSwipeAction = .like
            } label: {
                actionButton(name: "heart.fill", color: .green)
            }
            .frame(width: 48, height: 58)
        }
    }
    
}


private extension SwipeActionButtonsView {
    @ViewBuilder
    func actionButton(name: String, color: Color) -> some View {
        Image(systemName: name)
            .fontWeight(.heavy)
            .foregroundStyle(color)
            .background {
                Circle()
                    .fill(.white)
                    .frame(width: 48, height: 48)
                    .shadow(radius: 6)
            }
    }
}

#Preview {
    SwipeActionButtonsView(viewModel: CardsViewModel(service: CardService()))
}
