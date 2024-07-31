//
//  LoginWithPasswordView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 31/07/24.
//

import Foundation
import SwiftUI

struct LoginWithPasswordView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("Welcome back 👋")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                
                Text("Please enter your email & password to sign in.")
                    .font(.body)
                    .padding(.horizontal)
                
                Text("Email")
                    .font(.body)
                    .fontWeight(.semibold)
                    .padding([.top, .leading, .trailing])
                
                TextField("Email", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                
                Text("Password")
                    .font(.body)
                    .fontWeight(.semibold)
                    .padding([.top, .leading, .trailing])
                
                TextField("Password", text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                
                
                HStack {
                    
                    Text("Remember me")
                        .font(.body)
                        .fontWeight(.semibold)
            
                    
                    Spacer()
                    
                    Text("Forgot password?")
                        .font(.body)
                        .fontWeight(.semibold)
            
                    
                }.padding([.top, .leading, .trailing])
                
                Divider().padding(.vertical)
                
                Text("Don't have an account? Sign up")
                    .font(.body)
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .center)
            
                
                Spacer()
                
                Divider().padding(.vertical)
                
                HStack {
                   
                    Button(
                        action: { },
                        label: { Text("Sign In").fontWeight(.semibold) })
                        .buttonStyle(ElevatedButtonStyle())
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                }.padding(.horizontal)
                
            }.toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Action for trailing button
                    }) {
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
    }
}

struct LoginWithPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        LoginWithPasswordView()
    }
}
