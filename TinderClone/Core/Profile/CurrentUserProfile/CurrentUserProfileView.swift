//
//  CurrentUserProfileView.swift
//  TinderClone
//
//  Created by Imam Robani on 16/04/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfile = false
    
    let user: User
    
    var body: some View {
        NavigationStack {
            List {
                // header view
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture { showEditProfile.toggle() }
                
                // account info
                Section {
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text(user.fullname)
                    }
                    
                    HStack {
                        Text("Email")
                        
                        Spacer()
                        
                        Text("test@mail.com")
                    }
                }
                
                // legal
                Section {
                    Text("Term of service")
                }
                
                // logout/delete
                Section {
                    Button("Logout") {
                        print("DEBUG: Logout here ...")
                    }
                    .foregroundStyle(.red)
                }
                
                Section {
                    Button("Delete Account") {
                        print("DEBUG: Delete account here ...")
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[2])
}
