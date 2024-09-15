//
//  ProfileView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 13/07/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                
                userProfile()
                userCreateStoriesUI()
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
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
                }.onAppear {
                    homeViewModel.fetchImages()
                    homeViewModel.fetchBookmarkTab()
                }
        }
    }
    
    
    func userProfile() -> some View {
        VStack(alignment: .leading, spacing: 16.0) {
            HStack {
                
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                                      
                VStack(alignment: .leading) {
                
                    Text("Andrew Ainsley")
                        .font(.subheadline).fontWeight(.semibold)
                    
                    Text("@andrew_ainsley")
                        .font(.caption)
                }
                
                Spacer()
                
                ChipView(label: "Edit Profile")
            }
            
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Tech enthusiast, likes to share stories about technology and the digital world.").font(.subheadline)
                
                Text("www.andrewainsley.com").font(.subheadline)
            }
            
            VStack {
                HStack {
                    
                    Spacer()
                    
                    VStack(spacing: 8.0) {
                        Text("126").font(.headline)
                        
                        Text("Stories").font(.caption)
                    }
                    
                    Spacer()
                    
                    Divider().frame(height: 100).background(Color.gray)
                    
                    Spacer()
                    
                    VStack(spacing: 8.0) {
                        Text("4,259").font(.headline)
                        
                        Text("Followers").font(.caption)
                    }
                    
                    Spacer()
                    
                    Divider().frame(height: 100).background(Color.gray)
                    
                    Spacer()
                    
                    VStack(spacing: 8.0) {
                        Text("145").font(.headline)
                        
                        Text("Following").font(.caption)
                    }
                    
                    Spacer()
                }
                
                Divider().background(Color.gray)
            }
            
        }.padding([.leading, .trailing])
    }
    
    
    func userCreateStoriesUI() -> some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
