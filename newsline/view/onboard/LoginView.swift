//
//  LoginView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 30/07/24.
//

import Foundation
import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            
            Image("Newsline")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
            
            Text("Newsline")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            Text("Welcome! Let's dive in into your account!")
                .font(.body)
                .padding(.horizontal)
            
            Button(
                action: { },
                label: {
                    Text("Continue with Google").fontWeight(.semibold)
                })
            .buttonStyle(OutlinedButtonStyle())
            .frame(maxWidth: .infinity)
            
            Button(
                action: { },
                label: {
                    Text("Continue with Apple").fontWeight(.semibold)
                })
            .buttonStyle(OutlinedButtonStyle())
            .frame(maxWidth: .infinity)
            
            Button(
                action: { },
                label: {
                    Text("Continue with Facebook").fontWeight(.semibold)
                })
            .buttonStyle(OutlinedButtonStyle())
            .frame(maxWidth: .infinity)
            
            Button(
                action: { },
                label: {
                    Text("Continue with Twitter").fontWeight(.semibold)
                })
            .buttonStyle(OutlinedButtonStyle())
            .frame(maxWidth: .infinity)
            
            Button(
                action: { },
                label: {
                    Text("Sign in with password").fontWeight(.semibold)
                })
            .buttonStyle(ElevatedButtonStyle())
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            
            Text("Don't have an account? Sign up")
                .font(.body)
                .fontWeight(.light)
                .padding()
            
        }.padding(.horizontal)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
