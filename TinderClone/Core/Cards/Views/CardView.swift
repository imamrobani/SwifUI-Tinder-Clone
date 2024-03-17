//
//  CardView.swift
//  TinderClone
//
//  Created by Imam Robani on 17/03/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.lisaBlackPink2)
                .resizable()
                .scaledToFill()
                .frame(width: cardWidth, height: cardHeight)
            
            UserInfoView()
        }
        .frame(width: cardWidth, height: cardHeight)
        .clipShape(.rect(cornerRadius: 10))
    }
}

private extension CardView {
    var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}

#Preview {
    CardView()
}
