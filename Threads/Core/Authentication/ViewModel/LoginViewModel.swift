//
//  LoginViewModel.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""

    
    @MainActor
    func login() async throws {
       try await AuthService.shared.login(
            withEmail: email,
            password: password
        )
    }
}
