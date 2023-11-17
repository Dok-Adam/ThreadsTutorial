//
//  ThreadService.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 15.11.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
    }
    
    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .whereField("ownerId", isEqualTo: uid)
            .getDocuments()
        
        let threads = snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
}

//MARK: - Likes

extension ThreadService {
    static func likeThread(_ thread: Thread) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let threadRef = FirebaseConstants.ThreadsCollection.document(thread.id)
        async let _ = try await threadRef.collection("thread-likes").document(uid).setData([:])
        async let _ = try await threadRef.updateData(["likes": thread.likes + 1])
        async let _ = try await FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(thread.id).setData([:])
    }
    
    static func unlikeThread(_ thread: Thread) async throws {
        guard thread.likes > 0 else { return }
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let threadRef = FirebaseConstants.ThreadsCollection.document(thread.id)
        
        async let _ = threadRef.collection("thread-likes").document(uid).delete()
        async let _ = try await FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(thread.id).delete()
        async let _ = try await threadRef.updateData(["likes": thread.likes - 1])
    }
    
    static func checkIfUserLikedThread(_ thread: Thread) async throws -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        let snapshot = try await FirebaseConstants.UsersCollection
            .document(uid)
            .collection("user-likes")
            .document(thread.id)
            .getDocument()
        
        return snapshot.exists
    }
    
    static func fetchThreadReplies(forUser user: User) async throws -> [ThreadReply] {
        let snapshot = try await FirebaseConstants
            .RepliesCollection
            .whereField("threadReplyOwnerUid", isEqualTo: user.id)
            .getDocuments()
        
        var replies = snapshot.documents.compactMap({ try? $0.data(as: ThreadReply.self) })
        for i in 0 ..< replies.count {
            replies[i].replyUser = user
        }
        return replies
    }
    
    static func fetchThread(threadId: String) async throws -> Thread {
        let snapshot = try await FirebaseConstants
            .ThreadsCollection
            .document(threadId)
            .getDocument()
        
        return try snapshot.data(as: Thread.self)
    }
}
