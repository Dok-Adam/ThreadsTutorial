//
//  LoginView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Spacer()
                
                Image("Logo300")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                
                VStack {
                    TextField("Enter your email...", text: $email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifier())
                    
                    SecureField("Password", text: $password)
                        .modifier(ThreadsTextFieldModifier())
                }
                
                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text("Forgot password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.trailing, 28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.vertical)
                
                Button {
                    print("login")
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                    
                } label: {
                    HStack {
                        Text("Do you have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.footnote)
                    .foregroundColor(.black)
                    .padding(.vertical)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    LoginView()
}
