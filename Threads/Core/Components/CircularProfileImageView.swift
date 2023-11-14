//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("pic")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
