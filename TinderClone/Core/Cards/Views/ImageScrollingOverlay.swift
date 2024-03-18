//
//  ImageScrollingOverlay.swift
//  TinderClone
//
//  Created by Imam Robani on 18/03/24.
//

import SwiftUI

struct ImageScrollingOverlay: View {
    @Binding var currImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: false)
                }
            
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: true)
                }
        }
        .foregroundStyle(Color.white.opacity(0.01))
    }
}

private extension ImageScrollingOverlay {
    func updateImageIndex(increment: Bool) {
        if increment {
            guard currImageIndex < imageCount - 1 else { return }
            currImageIndex += 1
        } else {
            guard currImageIndex > 0 else { return }
            currImageIndex -= 1
        }
    }
}

#Preview {
    ImageScrollingOverlay(currImageIndex: .constant(1), imageCount: 1)
}
