//
//  CardStackView.swift
//  TinderClone
//
//  Created by Imam Robani on 20/03/24.
//

import SwiftUI

struct CardStackView: View {
    var body: some View {
        ZStack {
            ForEach(0 ..< 5) { card in
                CardView()
            }
        }
    }
}

#Preview {
    CardStackView()
}
