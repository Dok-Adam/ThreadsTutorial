//
//  ContentActionButtonView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 16.11.2023.
//

import SwiftUI

struct ContentActionButtonView: View {
    @ObservedObject var viewModel: ContentActionViewModel
    @State private var showReplySheet = false
    
    init(thread: Thread) {

        self.viewModel = ContentActionViewModel(thread: thread)
    }
    
    private var didLike: Bool {
        return viewModel.thread.didLike ?? false
    }
    
    private var thread: Thread {
        return viewModel.thread
    }
    
    func handleLikeTapped() {
        Task {
            if didLike {
                try await viewModel.unlikeThread()
            } else {
                try await viewModel.likeThread()
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack (spacing: 16) {
                Button {
                    handleLikeTapped()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .foregroundColor(didLike ? .red : .black)
                }
                
                Button {
                    showReplySheet.toggle()
                } label: {
                    Image(systemName: "bubble.right")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.rectanglepath")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                }
            }
            
            HStack(spacing: 4) {
                if thread.replyCount > 0 {
                    Text("\(thread.replyCount) replies")
                }
                
                if thread.replyCount > 0 && thread.likes > 0 {
                    Text("-")
                }
                
                if thread.likes > 0 {
                    Text("\(thread.likes) likes")
                        
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.vertical, 4)
        }
        .sheet(isPresented: $showReplySheet) {
            ThreadReplyView(thread: thread)
        }
    }
}

#Preview {
    ContentActionButtonView(thread: DeveloperPreview.shared.thread)
}
