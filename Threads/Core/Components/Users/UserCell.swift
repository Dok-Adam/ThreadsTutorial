//
//  UserCell.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        
        HStack {
            CircularProfileImageView(user: user, size: .small)
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
                    .font(.footnote)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user: DeveloperPreview.shared.user)
}
