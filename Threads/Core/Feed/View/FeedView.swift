//
//  FeedView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { thread in
                        ThreadCell()
                    }
                }
            }
            .refreshable {
                print("Refresh")
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
