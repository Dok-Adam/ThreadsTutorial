//
//  RegistrationView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
   
    @Environment (\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            
            VStack {
                Spacer()
                
                Image("Logo300")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                
                VStack {
                    TextField("Enter your email...", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifier())
                    
                    SecureField("Password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifier())
                    
                    TextField("Enter your username...", text: $viewModel.username)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifier())
                    
                    TextField("Enter your fullname...", text: $viewModel.fullname)
                        .modifier(ThreadsTextFieldModifier())
                }
                
                
                
                Button {
                    Task { try await viewModel.createUser() }
                } label: {
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                Divider()

                    Button {
                        dismiss()
                    } label: {
                        
                        HStack {
                            Text("Do you have an account?")
                            
                            Text("Sign In")
                                .fontWeight(.bold)
                        }
                        .font(.footnote)
                        .foregroundColor(.black)
                        .padding(.vertical)
                }
            }
        }
    }
}


#Preview {
    RegistrationView()
}
