//
//  UserContentListView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 15.11.2023.
//

import SwiftUI

struct UserContentListView: View {
    @StateObject var viewModel: UserContentListViewModel
    @State private var selectedFilter: ProfileFilter = .threads
    @Namespace var animation
    private var dimension = UIScreen.main.bounds.width
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    
    var body: some View {
        
        VStack {
            HStack {
                ForEach(ProfileFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: (dimension / 2) - 20, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: (dimension / 2) - 20, height: 1)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedFilter = filter
                        }
                    }
                }
            }
            
            ScrollView {
                LazyVStack {
                    switch selectedFilter {
                    case .threads:
                        
                        ForEach(viewModel.threads) { thread in
                            ThreadCell(thread: thread)
                                .transition(.move(edge: .leading))
                        }
                        
                    case .replies:
                        ForEach(viewModel.replies) { reply in
                            ThreadReplyProfileCell(reply: reply)
                                .transition(.move(edge: .trailing))
                        }
                    }
                }
            }
            .refreshable {
                Task { try await viewModel.fetchUserThreads() }
                Task { try await viewModel.fetchUserReplies() }
            }
        }
        .padding(.vertical, 8)
        

    }
}

#Preview {
    UserContentListView(user: DeveloperPreview.shared.user)
}
