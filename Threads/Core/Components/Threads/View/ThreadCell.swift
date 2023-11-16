//
//  ThreadCell.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button {
                            print("edit threds")
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                    
                    ContentActionButtonView()
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
    ThreadCell(thread: DeveloperPreview.shared.thread)
}
