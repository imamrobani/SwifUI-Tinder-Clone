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
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(.lisaBlackPink2)
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            
            UserInfoView()
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
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degress = Double(value.translation.width / 25)
        
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
    
        if abs(width) < abs(SizeConstants.screenCutOff) {
            xOffset = 0
            degress = 0
        }
    }
}

#Preview {
    CardView()
}
