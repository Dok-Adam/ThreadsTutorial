//
//  PreviewProvider.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 15.11.2023.
//

import SwiftUI
import Firebase

class DeveloperPreview {
    static let shared = DeveloperPreview()
    let user = User(id: NSUUID().uuidString, fullname: "Max", email: "max@gmail.com", username: "max max")
    
    lazy var  thread = Thread(
        ownerId: "123",
        caption: "wewe", 
        timestamp: Timestamp(),
        likes: 10,
        replyCount: 10,
        user: user
    )
    
    lazy var reply = ThreadReply(
        threadId: "123",
        replyText: "dwfqef",
        threadReplyOwnerUid: "12345",
        threadOwnerUid: "1234",
        timestamp: Timestamp(),
        thread: thread,
        replyUser: user
    )
}
