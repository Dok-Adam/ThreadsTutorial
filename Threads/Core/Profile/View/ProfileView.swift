//
//  ProfileView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileFilter = .threads
    @Namespace var animation
    private var dimension = UIScreen.main.bounds.width
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Chon Chongon")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("chonchon")
                                .font(.subheadline)
                        }
                        
                        Text("I'm trainer of crossfit. Call me")
                            .font(.footnote)
                        
                        Text("2 followers")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    CircularProfileImageView()
                }
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
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
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
