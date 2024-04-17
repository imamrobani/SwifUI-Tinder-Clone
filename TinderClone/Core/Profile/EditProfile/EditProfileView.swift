//
//  EditProfileView.swift
//  TinderClone
//
//  Created by Imam Robani on 17/04/24.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var bio = ""
    @State private var occupation = "Actress"
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileImageGridView(user: user)
                    .padding()
                
                VStack(spacing: 24) {
                    VStack(alignment: .leading) {
                        titleSection(name: "ABOUT ME")
                        
                        TextField("Add your bio", text: $bio, axis: .vertical)
                            .padding()
                            .frame(height: 64, alignment: .leading)
                            .background(Color(.secondarySystemBackground))
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        titleSection(name: "OCCUPATION")
                        
                        HStack {
                            Image(systemName: "book")
                            Text("Occupation")
                            
                            Spacer()
                            
                            Text(occupation)
                                .font(.footnote)
                        }
                        .modifier(BgCardSectionModifier())
                    }
                    
                    VStack(alignment: .leading) {
                        titleSection(name: "GENDER")
                        
                        HStack {
                            Text("Woman")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .modifier(BgCardSectionModifier())
                    }
                    
                    VStack(alignment: .leading) {
                        titleSection(name: "SEXUAL ORIENTATION")
                        
                        HStack {
                            Text("Straight")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .modifier(BgCardSectionModifier())
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

private extension EditProfileView {
    func titleSection(name: String) -> some View {
        Text(name)
            .font(.subheadline)
            .fontWeight(.bold)
            .padding(.leading)
    }
}

private struct BgCardSectionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.secondarySystemBackground))
            .font(.subheadline)
        
    }
}

#Preview {
    EditProfileView(user: MockData.users[2])
}
