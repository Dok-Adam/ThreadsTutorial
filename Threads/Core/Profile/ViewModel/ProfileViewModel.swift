//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: \(String(describing: user))")
        }.store(in: &cancellables)
    }
}
