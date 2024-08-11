//
//  OnboardView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 13/07/24.
//

import SwiftUI

struct OnboardView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text("Stay Informed, Anytime, Anywhere")
                    .font(.title).padding(.horizontal)
                
                Text("Welcome to our news app, your go-to source for breaking news, exclusive stories and personalized content.")
                    .font(.body).padding(.top).padding(.horizontal)
                
                
                Divider().padding(.vertical)
                
                HStack(spacing: 16) {
                    Button(action: { }, label: { Text("Skip").fontWeight(.semibold) })
                        .buttonStyle(OutlinedButtonStyle())
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Button(action: {  },
                           label: { NavigationLink(destination: LoginView()) {
                        Text("Continue").fontWeight(.semibold)
                    } })
                        .buttonStyle(ElevatedButtonStyle())
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                }.padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
}


struct OutlinedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(outlinedButtonColor)
            .foregroundColor(primaryColor)
            .cornerRadius(50)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
          
    }
}

struct ElevatedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(elevatedButtonColor)
            .foregroundColor(.white)
            .cornerRadius(50)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
 
struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
