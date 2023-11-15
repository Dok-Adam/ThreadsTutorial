//
//  UserContentListView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 15.11.2023.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter: ProfileFilter = .threads
    @Namespace var animation
    private var dimension = UIScreen.main.bounds.width
    
    
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
            
            LazyVStack {
                ForEach(0 ... 10, id: \.self) { thread in
                    ThreadCell()
                }
            }
        }
        .padding(.vertical, 8)

    }
}

#Preview {
    UserContentListView()
}
