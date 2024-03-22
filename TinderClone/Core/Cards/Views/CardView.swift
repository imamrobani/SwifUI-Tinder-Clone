//
//  CardView.swift
//  TinderClone
//
//  Created by Imam Robani on 17/03/24.
//

import SwiftUI

struct CardView: View {
    @State private var xOffset: CGFloat = 0
    @State private var degress: Double = 0
    @State private var currImageIndex = 0
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageUrls[currImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay {
                        ImageScrollingOverlay(currImageIndex: $currImageIndex, imageCount: imageCount)
                    }
                
                CardImageIndicatorView(currImageIndex: currImageIndex, imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            
            UserInfoView(user: user)
        }
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(.rect(cornerRadius: 10 ))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degress))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    var user: User {
        return model.user
    }
    
    var imageCount: Int {
        return user.profileImageUrls.count
    }
}

private extension CardView {
    func returnToCenter() {
        xOffset = 0
        degress = 0
    }
    
    func swipeRight() {
        xOffset = 500
        degress = 12
    }
    
    func swipeLeft() {
        xOffset = -500
        degress = -12
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degress = Double(value.translation.width / 25)
        
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
    
        if abs(width) < abs(SizeConstants.screenCutOff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutOff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

#Preview {
    CardView(model: CardModel(user: MockData.users[2]))
}
