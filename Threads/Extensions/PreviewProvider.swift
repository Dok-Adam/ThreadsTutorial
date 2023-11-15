//
//  PreviewProvider.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 15.11.2023.
//

import SwiftUI



class DeveloperPreview {
    static let shared = DeveloperPreview()
    let user = User(id: NSUUID().uuidString, fullname: "Max", email: "max@gmail.com", username: "max max")
}
