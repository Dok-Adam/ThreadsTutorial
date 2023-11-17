//
//  ThreadCreationViewModel.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 15.11.2023.
//

import Firebase

class ThreadCreationViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerId: uid, caption: caption, timestamp: Timestamp(), likes: 0, replyCount: 0)
        try await  ThreadService.uploadThread(thread)
    }
}
