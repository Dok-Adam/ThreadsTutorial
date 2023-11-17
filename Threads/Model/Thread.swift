//
//  Thread.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 15.11.2023.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable, Hashable {
    @DocumentID var threadId: String?
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    let ownerId: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var replyCount: Int
    var user: User?
    
    var didLike: Bool? = false
    
}
