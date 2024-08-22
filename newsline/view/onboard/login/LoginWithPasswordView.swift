//
//  LoginWithPasswordView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 31/07/24.
//

import Foundation
import SwiftUI

struct LoginWithPasswordView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    @StateObject private var viewmodel = OnboardViewModel()
    
    @State private var isChecked: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
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
            
            HStack {
                Image(systemName: "envelope.fill")  // Email icon from SF Symbols
                        .foregroundColor(.gray)
                            
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(true)
                    .padding(.horizontal)
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
            
            Text("Password")
                .font(.body)
                .padding([.top, .leading, .trailing])
            
            HStack {
                Image(systemName: "lock.fill")  // Email icon from SF Symbols
                        .foregroundColor(.gray)
                            
                if isPasswordVisible {
                    TextField("Password", text: $password)
                        .disableAutocorrection(true)
                        .padding(.horizontal)
                } else {
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .padding(.horizontal)
                    }
            
                Button(action: { isPasswordVisible.toggle() }) {
                    Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill" )
                        .foregroundColor(.gray)
         
                    }
                }
            .padding()
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
            
            HStack {
                
                HStack(alignment: .center, spacing: 8) {
                    
                    Button(action: {
                                   isChecked.toggle()
                               }) {
                                   Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                       .foregroundColor(isChecked ? .blue : .gray)
                               }
                    
                    Text("Remember me")
                        .font(.body)
                        .fontWeight(.semibold)
                    
                }
                
                Spacer()
                
                NavigationLink(destination: ResetPasswordView()) {
                    Text("Forgot password?")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                
            }.padding([.top, .leading, .trailing])
            
            Divider().padding(.vertical)
            
            HStack {
                Text("Don't have an account? ")
                    .font(.body)
                    .fontWeight(.light)
                    
                NavigationLink(destination:  SignupWithPasswordView()) {
                    Text("Sign up")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(primaryColor)
                }
                
            }.frame(maxWidth: .infinity, alignment: .center)
           
            Spacer()
            
            Divider().padding(.vertical)
            
            HStack {
                
                Button(
                    action: {
                        viewmodel.loginWithPassword(email: email, password: password)
                    },
                    label: {
                        NavigationLink(destination: CompleteView()) {
                            Text("Sign In").fontWeight(.semibold)
                        }
                    })
                .buttonStyle(ElevatedButtonStyle())
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
            }.padding(.horizontal)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.black)
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
