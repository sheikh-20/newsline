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
                               Image(systemName: "line.horizontal.3")
                           }
                       }
                       ToolbarItem(placement: .navigationBarTrailing) {
                           Button(action: {
                               // Action for trailing button
                           }) {
                               Image(systemName: "square.and.arrow.up")
                           }
                       }
                       
                       ToolbarItem(placement: .navigationBarTrailing) {
                           Button(action: {
                               // Action for trailing button
                           }) {
                               Image(systemName: "gear")
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
