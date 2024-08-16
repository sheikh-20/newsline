//
//  BookmarkScreen.swift
//  newsline
//
//  Created by Sheikh Mohideen on 13/07/24.
//

import SwiftUI

struct BookmarkView: View {
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
                               Text("Bookmark")
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
                               if let shareImage = UIImage(named: "search") {
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

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}
