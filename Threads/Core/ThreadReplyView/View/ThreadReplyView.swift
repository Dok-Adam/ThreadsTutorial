//
//  ThreadReplyView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 16.11.2023.
//

import SwiftUI

struct ThreadReplyView: View {
    let thread: Thread
    @Environment (\.dismiss) var dismiss
    @State private var replyText = ""
    @State private var threadViewHeight: CGFloat = 24
    @StateObject var viewModel = ThreadReplyViewModel()
    private var currentUser: User? {
        return UserService.shared.currentUser
    }
    
    func setThreadViewHeight() {
        let imageDimension: CGFloat = ProfileImageSize.small.dimension
        let padding: CGFloat = 16
        let width = UIScreen.main.bounds.width - imageDimension - padding
        let font = UIFont.systemFont(ofSize: 12)
        let captionSize = thread.caption.heightWithConstraineWidth(width, font: font)
        threadViewHeight = captionSize + imageDimension
        
        print("\(captionSize)")
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .top) {
                        VStack {
                            CircularProfileImageView(user: thread.user, size: .small)
                            
                            Rectangle()
                                .frame(width: 2, height: threadViewHeight)
                                .foregroundColor(Color(.systemGray4))
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(thread.user?.username ?? "")
                                .fontWeight(.semibold)
                            
                            Text(thread.caption)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                        
                        Spacer()
                    }
                    
                    HStack(alignment: .top) {
                        CircularProfileImageView(user: currentUser, size: .small)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(currentUser?.username ?? "")
                            
                            TextField("Add your reply...", text: $replyText, axis: .vertical)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                    }
                    
                    Spacer()
                }
                .padding()
                
            }
            .onAppear{
                setThreadViewHeight()
            }
            .navigationTitle("Reply")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.uploadThreadReply(replyText: replyText, thread: thread)
                            dismiss()
                        }
                    } label: {
                        
                        Text("Post")
                    }
                    .opacity(replyText.isEmpty ? 0.5 : 1.0)
                    .disabled(replyText.isEmpty)
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
    ThreadReplyView(thread: DeveloperPreview.shared.thread)
}
