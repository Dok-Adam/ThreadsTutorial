//
//  ThreadReplyCell.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 16.11.2023.
//

import SwiftUI

struct ThreadReplyCell: View {
    let reply: ThreadReply
    
    private var user: User? {
        return reply.replyUser
    }
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .top, spacing: 12) {
                
                CircularProfileImageView(user: user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    HStack {
                        Text(user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text(reply.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button {
                            print("edit threds")
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    
                    Text(reply.replyText)
                        .font(.footnote)
                    
                }
            }
            
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadReplyCell(reply: DeveloperPreview.shared.reply)
}
