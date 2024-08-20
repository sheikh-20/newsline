//
//  SignupWithPasswordView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 01/08/24.
//

import Foundation
import SwiftUI

struct SignupWithPasswordView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    @StateObject private var viewmodel = OnboardViewModel()
    
    @State private var isChecked: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Create Account 👩‍💻")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            Text("Join our community and personalize your news experience")
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
                .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1))
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
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                } else {
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    }
            
                Button(action: { isPasswordVisible.toggle() }) {
                    Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill" )
                        .foregroundColor(.gray)
         
                    }
                }
            .padding()
                .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
            
            
            HStack(alignment: .center, spacing: 8) {
                
                Button(action: {
                               isChecked.toggle()
                           }) {
                               Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                   .foregroundColor(isChecked ? .blue : .gray)
                           }
                           
                
                Text("I agree to Newsline Terms & Policy")
                    .font(.body)
                    .fontWeight(.semibold)
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .padding([.top, .leading, .trailing])
            
            Divider().padding(.vertical)
            
            
            HStack {
                Text("Already have an account? ")
                    .font(.body)
                    .fontWeight(.light)
                    
                NavigationLink(destination: LoginWithPasswordView()) {
                    Text("Sign in")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(primaryColor)
                }
                
            }.frame(maxWidth: .infinity, alignment: .center)
           
            
            Spacer()
            
            Divider().padding(.vertical)
            
            HStack {
               
                Button(
                    action: { },
                    label: {
                        NavigationLink(destination: UserCountryView()) {
                            Text("Sign up").fontWeight(.semibold)
                        }
                    })
                    .buttonStyle(ElevatedButtonStyle())
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
            }.padding(.horizontal)
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

struct SignupWithPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SignupWithPasswordView()
    }
}
