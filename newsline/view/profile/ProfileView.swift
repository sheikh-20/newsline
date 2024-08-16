//
//  ProfileView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 13/07/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
                   VStack {
                       Text("Hello, World!")
                       // Your main content goes here
                   }
                   .toolbar {
                       ToolbarItem(placement: .principal) {
                           HStack {
                               Spacer()
                               Text("Profile")
                                   .font(.headline)
                               Spacer()
                           }
                       }
                       ToolbarItem(placement: .navigationBarLeading) {
                           Button(action: {
                               // Action for leading button
                           }) {
                               Image("Newsline")
                                   .resizable()
                                   .scaledToFill()
                                   .frame(width: 30, height: 30)
                           }
                       }
                       ToolbarItem(placement: .navigationBarTrailing) {
                           Button(action: {
                               // Action for trailing button
                           }) {
                               if let shareImage = UIImage(named: "share") {
                                   Image(uiImage: shareImage)
                                       .resizable() // Make it resizable if needed
                                       .scaledToFit() //
                                       .imageScale(.large)
                                       .symbolVariant(.circle)
                                       .frame(width: 20, height: 20)
                               }
                           }
                       }
                       
                       ToolbarItem(placement: .navigationBarTrailing) {
                           Button(action: {
                               // Action for trailing button
                           }) {
                               if let shareImage = UIImage(named: "settings") {
                                   Image(uiImage: shareImage)
                                       .resizable() // Make it resizable if needed
                                       .scaledToFit() //
                                       .imageScale(.large)
                                       .symbolVariant(.circle)
                                       .frame(width: 20, height: 20)
                               }
                           }
                       }
                   }
               }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
