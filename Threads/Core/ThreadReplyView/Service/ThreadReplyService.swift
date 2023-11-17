//
//  ThreadReplyService.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 16.11.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadReplyService {
    static func uploadThreadReply(_ reply: ThreadReply, toThread thread: Thread) async throws {
        guard let replyData = try? Firestore.Encoder().encode(reply) else { return }
        async let _ = try await FirebaseConstants.RepliesCollection.document().setData(replyData)
        async let _ = try await FirebaseConstants.ThreadsCollection.document(thread.id).updateData([
            "replyCount": thread.replyCount + 1
        ])
    }
    
    static func fetchThreadReplies(forThread thread: Thread) async throws -> [ThreadReply] {
        let snapshot = try await FirebaseConstants
            .RepliesCollection
            .whereField("threadId", isEqualTo: thread.id)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: ThreadReply.self) })
    }
    
    static func fetchThreadReplies(forUser user: User) async throws -> [ThreadReply] {
        let snapshot = try await FirebaseConstants
            .RepliesCollection
            .whereField("threadOwnerUid", isEqualTo: user.id)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: ThreadReply.self) })

    }
}
