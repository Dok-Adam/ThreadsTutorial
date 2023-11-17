//
//  ProfileView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User

    private var dimension = UIScreen.main.bounds.width
    
    init(user: User) { 
        self.user = user
    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                
                ProfileHeaderView(user: user)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: dimension - 20, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
               UserContentListView(user: user)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}

