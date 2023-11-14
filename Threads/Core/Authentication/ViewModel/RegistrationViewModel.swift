//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var fullname = ""
    
    @MainActor
    func createUser() async throws {
       try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username
        )
    }
}
