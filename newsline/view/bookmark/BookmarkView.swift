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
                               Image(systemName: "line.horizontal.3")
                           }
                       }
                       ToolbarItem(placement: .navigationBarTrailing) {
                           Button(action: {
                               // Action for trailing button
                           }) {
                               Image(systemName: "magnifyingglass")
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
