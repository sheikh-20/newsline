//
//  HomeApp.swift
//  newsline
//
//  Created by Sheikh Mohideen on 14/07/24.
//

import Foundation
import SwiftUI

struct HomeApp: View {
    var body: some View {
        
        NavigationView {
            TabView {
                HomeView().tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                DiscoverView().tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Discover")
                }
                BookmarkView().tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Bookmark")
                }
                ProfileView().tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct HomeApp_Previews: PreviewProvider {
    static var previews: some View {
        HomeApp()
    }
}
