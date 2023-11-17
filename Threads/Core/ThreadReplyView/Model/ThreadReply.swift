//
//  ThreadReply.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 16.11.2023.
//

import Firebase
import FirebaseFirestoreSwift

struct ThreadReply: Identifiable, Codable {
    @DocumentID var replyId: String?
    let threadId: String
    let replyText: String
    let threadReplyOwnerUid: String
    let threadOwnerUid: String
    let timestamp: Timestamp
    var thread: Thread?
    var replyUser: User?
    
    var id: String {
        return replyId ?? NSUUID().uuidString
    }
}
