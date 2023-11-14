//
//  UserCell.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        
        HStack {
            CircularProfileImageView()
            
            VStack(alignment: .leading) {
                Text("chonchon")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Chon Chongon")
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
    UserCell()
}
