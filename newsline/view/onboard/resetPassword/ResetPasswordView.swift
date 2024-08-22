//
//  ResetPasswordView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 01/08/24.
//

import Foundation
import SwiftUI

struct ResetPasswordView: View {
    
    @State private var email: String = ""
    
    @StateObject private var viewmodel = OnboardViewModel()
    
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Reset your password 🔑")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            Text("Please enter your email and we will send an OTP code in the next step to reset your password.")
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
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
       
            Spacer()
        
            Divider().padding(.vertical)
            
            HStack {
                Button(
                    action: { presentationMode.wrappedValue.dismiss() },
                    label: {
                        Text("Continue").fontWeight(.semibold)
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

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
