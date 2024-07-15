//
//  HomeView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 13/07/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
                   VStack {
                       Text("Hello, World!")
                       // Your main content goes here
                   }
                   .toolbar {
                    
                       ToolbarItem(placement: .navigationBarLeading) {
                           HStack {
                               Image(systemName: "person.crop.circle")
                                                          .resizable()
                                                          .aspectRatio(contentMode: .fit)
                                                          .frame(width: 36, height: 36)
                                                          .clipShape(Circle())
                                                      
                               
                               VStack(alignment: .leading) {
                                   Text("Welcome back 👋")
                                       .font(.caption)
                                                          
                                   Text("Andrew Ainsley")
                                       .font(.subheadline)
                                                          
                               }
                           }
                       }
                       ToolbarItem(placement: .navigationBarTrailing) {
                           Button(action: {
                               // Action for trailing button
                           }) {
                               Image(systemName: "bell")
                           }
                       }
                   }
               }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
