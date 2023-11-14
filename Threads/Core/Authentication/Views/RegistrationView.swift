//
//  RegistrationView.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
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
                    TextField("Enter your email...", text: $email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifier())
                    
                    SecureField("Password", text: $password)
                        .modifier(ThreadsTextFieldModifier())
                    
                    TextField("Enter your username...", text: $username)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifier())
                    
                    TextField("Enter your fullname...", text: $fullname)
                        .modifier(ThreadsTextFieldModifier())
                }
                
                
                
                Button {
                    print("sign Up")
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
