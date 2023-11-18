//
//  CurrentUserProfileViewModel.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 15.11.2023.
//

import Foundation
import Combine
import SwiftUI
import PhotosUI

class CurrentUserProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
   
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}

