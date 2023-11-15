//
//  User.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    var id: String
    var fullname: String
    var email: String
    var username: String
    var profileImageUrl: String?
    var bio: String?
}
