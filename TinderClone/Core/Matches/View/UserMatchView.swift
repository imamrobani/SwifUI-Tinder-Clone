//
//  UserMatchView.swift
//  TinderClone
//
//  Created by Imam Robani on 18/04/24.
//

import SwiftUI

struct UserMatchView: View {
    @Binding var show: Bool
    @EnvironmentObject var matchManager: MatchManager
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea()
            
            VStack(spacing: 120) {
                VStack {
                    Image(.tinderItsamatch)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                    
                    if let matchedUser = matchManager.matchUser {
                        Text("You and \(matchedUser.fullname) have liked each")
                            .foregroundStyle(.white)
                    }
                }
                
                HStack(spacing: 16) {
                    Image(MockData.users[3].profileImageUrls[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay {
                            Circle()
                                .stroke(.white ,lineWidth: 2)
                                .shadow(radius: 4)
                        }
                    
                    if let matchedUser = matchManager.matchUser {
                        Image(matchedUser.profileImageUrls[0])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay {
                                Circle()
                                    .stroke(.white ,lineWidth: 2)
                                    .shadow(radius: 4)
                            }
                    }
                }
                
                VStack(spacing: 16) {
                    Button("Send Message") {
                        show.toggle()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.pink)
                    .clipShape(Capsule())
                    
                    Button("Keep Swiping") {
                        show.toggle()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.clear)
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.white, lineWidth: 1)
                            .shadow(radius: 4)
                    }
                }
            }
        }
    }
}

#Preview {
    UserMatchView(show: .constant(false))
        .environmentObject(MatchManager())
}
