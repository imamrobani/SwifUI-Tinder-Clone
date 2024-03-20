//
//  CardImageIndicatorView.swift
//  TinderClone
//
//  Created by Imam Robani on 20/03/24.
//

import SwiftUI

struct CardImageIndicatorView: View {
    let currImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< imageCount, id: \.self) { index in
                Capsule()
                    .foregroundStyle(currImageIndex == index ? .white : .gray)
                    .frame(width: imageIndicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}

private extension CardImageIndicatorView {
    var imageIndicatorWidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(imageCount) - 28
    }
}

#Preview {
    CardImageIndicatorView(currImageIndex: 2, imageCount: 4)
        .preferredColorScheme(.dark)
}
