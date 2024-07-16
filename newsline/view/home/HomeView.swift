//
//  HomeView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 13/07/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                trendingSection()
                
                recentStoriesSection()
                
                Spacer()
                
                   }
                   .toolbar {
                    
                       ToolbarItem(placement: .navigationBarLeading) {
                           HStack {
                               
                               NavigationLink(destination: { NotificationView() }) {
                                   Image(systemName: "person.crop.circle")
                                                              .resizable()
                                                              .aspectRatio(contentMode: .fit)
                                                              .frame(width: 36, height: 36)
                                                              .clipShape(Circle())
                                                   
                               }
                               
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
        }.onAppear {
            homeViewModel.fetchImages()
        }
    }
    
    func trendingSection() -> some View {
        
        VStack {
            HStack(alignment: .center) {
                Text("Trending").font(.title2).fontWeight(.semibold)
                
                Spacer()
                
                Button(
                    action: { },
                    label: {
                        HStack {
                            Text("View All")
                            Image(systemName: "chevron.right")
                        }
                    }
                )
            }.padding([.leading, .trailing, .top], 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(homeViewModel.images) { image in
                        
                        AsyncImage(url: image.url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 250, height: 150)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 250, height: 150)
                                    .cornerRadius(8)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 250, height: 150)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                            @unknown default: EmptyView()
                            }
                        }
                        
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    func recentStoriesSection() -> some View {
        
        VStack {
            HStack(alignment: .center) {
                Text("Recent Stories").font(.title2).fontWeight(.semibold)
                
                Spacer()
                
                Button(
                    action: { },
                    label: {
                        HStack {
                            Text("View All")
                            Image(systemName: "chevron.right")
                        }
                    }
                )
            }.padding([.leading, .trailing, .top], 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(homeViewModel.images) { image in
                        
                        AsyncImage(url: image.url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 250, height: 150)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 250, height: 150)
                                    .cornerRadius(8)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 250, height: 150)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                            @unknown default: EmptyView()
                            }
                        }
                        
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    func openNotificationView() {
        
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
