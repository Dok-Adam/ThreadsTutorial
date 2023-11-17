//
//  ThreadCreationView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 15.11.2023.
//

import SwiftUI

struct ThreadCreationView: View {
    
    @StateObject var viewModel = ThreadCreationViewModel()
    @State private var caption = ""
    @Environment (\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: user, size: .small)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            Task {
                                try await viewModel.uploadThread(caption: caption)
                                dismiss() }
                        } label: {
                            Text("Post")
                        }
                            .opacity(caption.isEmpty ? 0.5 : 1.0)
                            .disabled(caption.isEmpty)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                }
                           
                
                ToolbarItem(placement: .navigationBarLeading) {

                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .foregroundColor(.black)
                              
                    }
                }
            }
        }
    }
}

#Preview {
    ThreadCreationView()
}
