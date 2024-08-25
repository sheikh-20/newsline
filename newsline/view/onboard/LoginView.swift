//
//  LoginView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 30/07/24.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
        
            Spacer()
            
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
                .padding(.bottom)
            
            Spacer()
            
            VStack(spacing: 16.0) {
                Button(
                    action: { },
                    label: {
                        Text("Continue with Google").font(.system(size: 16.0, weight: .semibold))
                    })
                .buttonStyle(SocialLoginButtonStyle())
                .frame(maxWidth: .infinity)
                
                Button(
                    action: { },
                    label: {
                        Text("Continue with Apple").font(.system(size: 16.0, weight: .semibold))
                    })
                .buttonStyle(SocialLoginButtonStyle())
                .frame(maxWidth: .infinity)
                
                Button(
                    action: { },
                    label: {
                        Text("Continue with Facebook").font(.system(size: 16.0, weight: .semibold))
                    })
                .buttonStyle(SocialLoginButtonStyle())
                .frame(maxWidth: .infinity)
                
                Button(
                    action: { },
                    label: {
                        Text("Continue with Twitter").font(.system(size: 16.0, weight: .semibold))
                    })
                .buttonStyle(SocialLoginButtonStyle())
                .frame(maxWidth: .infinity)
            }
            
            Spacer()
            
            Button(
                action: { },
                label: {
                    NavigationLink(destination: LoginWithPasswordView()){
                        Text("Sign in with password").fontWeight(.semibold)
                    }
                })
            .buttonStyle(ElevatedButtonStyle())
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            
            HStack {
                Text("Don't have an account? ")
                    .font(.system(size: 16.0, weight: .light))
                    
                NavigationLink(destination: SignupWithPasswordView()) {
                    Text("Sign up")
                        .font(.system(size: 16.0, weight: .semibold))
                        .foregroundColor(primaryColor)
                }
                
            }.frame(maxWidth: .infinity, alignment: .center)
           
            Spacer()
            
        }.padding(.horizontal)
            .navigationBarBackButtonHidden(true)
    }
}

struct SocialLoginButtonStyle: ButtonStyle {
    
    @Environment(\.colorScheme) var colorScheme
    
    var textColor: Color {
        colorScheme == .dark ? Color.white : primaryColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
             .padding()
             .frame(maxWidth: .infinity, maxHeight: 50.0)
             .background(Color.clear)
             .overlay(
                 RoundedRectangle(cornerRadius: 50)
                     .stroke(Color.gray, lineWidth: 1) // Enhanced border color and increased width
             )
             .cornerRadius(50)
             .shadow(color: .black.opacity(0.2), radius: configuration.isPressed ? 2 : 5, x: 0, y: configuration.isPressed ? 1 : 3)
             .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
