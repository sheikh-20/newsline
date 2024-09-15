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
            VStack(alignment: .leading, spacing: 16) {
                
                trendingSection()
                
                recentStoriesSection()
                
                Spacer()
                
                   }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
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
                        if let shareImage = UIImage(named: "notifications") {
                            NavigationLink(destination: { NotificationView() }) {
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
            }.onAppear {
                homeViewModel.fetchImages()
                homeViewModel.fetchRecentStoriesTab()
            }
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
                    ForEach(homeViewModel.newsArcticle) { newsArticle in
                        
                        VStack(spacing: 8) {
                            AsyncImage(url: newsArticle.url) { phase in
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
                            
                            Text(newsArticle.title).font(.title3).fontWeight(.semibold).frame(alignment: .leading).lineLimit(3)
                            
                            HStack {
                                Text(newsArticle.channelName).font(.caption).fontWeight(.semibold).frame(alignment: .leading)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text("3 days ago").font(.caption2).fontWeight(.semibold).frame(alignment: .leading)
                                
                                Spacer()
                                
                                HStack {
                                    Image(systemName: "eye")
                                               .font(.system(size: 14))
                                               .foregroundColor(.blue)
                                    
                                    Text("\(newsArticle.userRead)").font(.caption2)
                                        .fontWeight(.semibold)
                                        .frame(alignment: .leading)
                                    
                                }
                                
                                Spacer()
                                
                                HStack {
                                    
                                    Image(systemName: "message")
                                               .font(.system(size: 14))
                                               .foregroundColor(.blue)
                                    
                                    Text("\(newsArticle.userComment)").font(.caption2)
                                        .fontWeight(.semibold)
                                        .frame(alignment: .leading)
                                    
                                }
                                
                                Spacer()
                                
                                Image(systemName: "square.and.arrow.up")
                                    .font(.system(size: 14))
                                    .foregroundColor(.blue)
                                            
                                           
                                Image(systemName: "ellipsis.vertical")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                
                            }.frame(width: .infinity, alignment: .leading)
                            
                        }.frame(width: 250, alignment: .leading)
                    }
                }
                .padding([.leading, .trailing, .top])
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
            }.padding([.leading, .trailing, .top])
         
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(homeViewModel.recentStoriesTab) { recentStoryTab in
                        ChipView(label: recentStoryTab.text)
                    }
                }
                .padding(.horizontal)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
               VStack(spacing: 16) {
                    ForEach(homeViewModel.newsArcticle) { newsArticle in
                        
                        VStack(spacing: 8) {
                        
                            HStack {
                                
                                VStack {
                                    Text(newsArticle.title).font(.title3).fontWeight(.semibold).frame(alignment: .leading).lineLimit(3)
                                    
                                    HStack {
                                        Text(newsArticle.channelName).font(.caption).fontWeight(.semibold).frame(alignment: .leading)
                                        
                                        Spacer()
                                    }
                                    
                                }
                                AsyncImage(url: newsArticle.url) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: 130, height: 100)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 130, height: 100)
                                            .cornerRadius(8)
                                    case .failure:
                                        Image(systemName: "photo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 130, height: 100)
                                            .background(Color.gray.opacity(0.2))
                                            .cornerRadius(8)
                                    @unknown default: EmptyView()
                                    }
                                }
                            }.frame(width: .infinity)
                            
                            HStack(spacing: 16) {
                                Text("3 days ago").font(.caption2).fontWeight(.semibold).frame(alignment: .leading)
                            
                                HStack {
                                    Image(systemName: "eye")
                                               .font(.system(size: 14))
                                               .foregroundColor(.blue)
                                    
                                    Text("\(newsArticle.userRead)").font(.caption2)
                                        .fontWeight(.semibold)
                                        .frame(alignment: .leading)
                                    
                                }
                             
                                HStack {
                                    
                                    Image(systemName: "message")
                                               .font(.system(size: 14))
                                               .foregroundColor(.blue)
                                    
                                    Text("\(newsArticle.userComment)").font(.caption2)
                                        .fontWeight(.semibold)
                                        .frame(alignment: .leading)
                                    
                                }
                                
                                Spacer()
                                
                                Image(systemName: "square.and.arrow.up")
                                    .font(.system(size: 14))
                                    .foregroundColor(.blue)
                                            
                                           
                                Image(systemName: "ellipsis.vertical")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                
                            }.frame(width: .infinity, alignment: .leading)
                            
                        }.frame(width: .infinity, alignment: .leading)
                    }
                }
                .padding([.leading, .trailing, .top])
            }.frame(width: .infinity)
        }
    }
    
    func openNotificationView() {
        
    }
}

struct ChipView: View {
    var label: String
    @State private var isSelected: Bool = false
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            HStack {
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                }
                Text(label)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(isSelected ? Color.blue : Color.gray.opacity(0.3))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? Color.blue : Color.gray, lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle()) // Retain the custom appearance
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
