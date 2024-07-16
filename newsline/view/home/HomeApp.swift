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
                ProfileView().tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Bookmark")
                }
                BookmarkView().tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
        
            }
        }
    }
}

struct HomeApp_Previews: PreviewProvider {
    static var previews: some View {
        HomeApp()
    }
}
