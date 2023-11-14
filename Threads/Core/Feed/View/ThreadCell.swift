//
//  ThreadCell.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        
        VStack {
            
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView()
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    HStack {
                        Text("chonchon")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text("1m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button {
                            print("edit threds")
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    
                    Text("I'm crossfit trainer. Call me")
                        .font(.footnote)
                    
                    HStack (spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                }
            }
            
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell()
}
