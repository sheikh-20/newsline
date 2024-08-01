//
//  SignupWithPasswordView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 01/08/24.
//

import Foundation
import SwiftUI

struct SignupWithPasswordView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        
        NavigationView {
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
                    
                    Text("I agree to Newsline Terms & Policy")
                        .font(.body)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                }.padding([.top, .leading, .trailing])
                
                Divider().padding(.vertical)
                
                Text("Already have an account? Sign in")
                    .font(.body)
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .center)
            
                
                Spacer()
                
                Divider().padding(.vertical)
                
                HStack {
                   
                    Button(
                        action: { },
                        label: { Text("Sign up").fontWeight(.semibold) })
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

struct SignupWithPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SignupWithPasswordView()
    }
}
