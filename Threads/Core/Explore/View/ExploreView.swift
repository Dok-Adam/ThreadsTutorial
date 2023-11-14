//
//  ExploreView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach (0 ... 10, id: \.self) { user in
                       UserCell()
                        
                        Divider()
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
