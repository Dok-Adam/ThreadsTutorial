//
//  EditProfileView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct EditProfileView: View {
    // Large Navigation Title
    // UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.purple]
    // Inline Navigation Title
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    
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
                            Text("Chon Chongon")
                                .font(.footnote)
                        }
                        Spacer()
                        
                        CircularProfileImageView()
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
                        
                        TextField("Add link...", text: $bio)
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
                    Text("Cancel")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Done")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
