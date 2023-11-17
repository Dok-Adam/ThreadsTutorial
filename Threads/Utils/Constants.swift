//
//  Constants.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 16.11.2023.
//

import Firebase

struct FirebaseConstants {
    
    static let Root = Firestore.firestore()
    static let UsersCollection = Root.collection("users")
    static let ThreadsCollection = Root.collection("threads")
    static let FollowingCollection = Root.collection("following")
    static let FollowersCollection = Root.collection("followers")
    static let RepliesCollection = Root.collection("replies")
    static let ActivityCollection = Root.collection("activity")
    
}
