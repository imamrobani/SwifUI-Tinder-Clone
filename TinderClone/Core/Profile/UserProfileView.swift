//
//  UserProfileView.swift
//  TinderClone
//
//  Created by Imam Robani on 16/04/24.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currImageIndex = 0
    
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("\(user.age)")
                    .font(.title2)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.pink)
                }
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ZStack(alignment: .top) {
                        Image(user.profileImageUrls[currImageIndex])
                            .resizable()
                            .scaledToFill()
                            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                            .overlay {
                                ImageScrollingOverlay(currImageIndex: $currImageIndex, imageCount: imageCount)
                            }
                        
                        CardImageIndicatorView(currImageIndex: currImageIndex, imageCount: imageCount)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("About Me")
                            .fontWeight(.semibold)
                        
                        Text("Some test bio for now")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .modifier(UserProfileCard())
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Essentials")
                            .fontWeight(.semibold)
                        
                        infoEssential(icon: "person", desc: "Woman")
                        infoEssential(icon: "arrow.down.forward.and.arrow.up.backward.circle", desc: "Straight")
                        infoEssential(icon: "book", desc: "Actress")
                    }
                    .modifier(UserProfileCard())
                }
            }
        }
    }
}

private extension UserProfileView {
    var imageCount: Int {
        return user.profileImageUrls.count
    }
}

private extension UserProfileView {
    @ViewBuilder
    func infoEssential(icon: String, desc: String) -> some View {
        HStack {
            Image(systemName: icon)
            
            Text(desc)
            
            Spacer()
        }
    }
}

private struct UserProfileCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.secondarySystemBackground))
            .font(.subheadline)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


#Preview {
    UserProfileView(user: MockData.users[2])
}
