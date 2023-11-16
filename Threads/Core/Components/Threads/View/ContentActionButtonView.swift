//
//  ContentActionButtonView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 16.11.2023.
//

import SwiftUI

struct ContentActionButtonView: View {
    var body: some View {
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
        

    }
}

#Preview {
    ContentActionButtonView()
}
