//
//  EditProfileView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment (\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    let user: User
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(user.fullname)
                                .font(.footnote)
                        }
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio...", text: $bio)
                            .font(.footnote)
                        
                        Divider()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Link")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        TextField("Add link...", text: $link)
                            .font(.footnote)
                    }
                    
                    Toggle("Private profile", isOn: $isPrivateProfile)
                        .font(.footnote)
                        .fontWeight(.regular)
                }
                .padding()
                .background(.white)
                .cornerRadius(12)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
                
            }
            .navigationTitle("EditProfile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task { try await viewModel.updateUserData() }
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.shared.user)
}
