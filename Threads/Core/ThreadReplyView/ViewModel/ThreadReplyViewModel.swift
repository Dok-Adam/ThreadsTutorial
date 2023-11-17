//
//  ThreadReplyViewModel.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 16.11.2023.
//

import Foundation
import Firebase

class ThreadReplyViewModel: ObservableObject {
    func uploadThreadReply(replyText: String, thread: Thread) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let reply = ThreadReply(
            threadId: thread.id,
            replyText: replyText,
            threadReplyOwnerUid: uid,
            threadOwnerUid: thread.ownerId,
            timestamp: Timestamp()
        )
        
        try await ThreadReplyService.uploadThreadReply(reply, toThread: thread)
    }
}
