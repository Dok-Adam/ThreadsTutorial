//
//  ContentActionViewModel.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 16.11.2023.
//

import Foundation

@MainActor
class ContentActionViewModel: ObservableObject {
    
    @Published var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
        Task { try await checkIfUserLikedThread() }
    }
    
    func likeThread() async throws {

        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() async throws {
        try await ThreadService.unlikeThread(thread)
        self.thread.didLike = false
        self.thread.likes -= 1
        
    }
    
    func checkIfUserLikedThread() async throws {
        let didLike = try await ThreadService.checkIfUserLikedThread(thread)
        
        if didLike {
            self.thread.didLike = true
        }
    }
}
