//
//  DiscoverView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 13/07/24.
//

import SwiftUI

struct DiscoverView: View {
    
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    weekTopStoriesSection()
                    
                    popularPublishers()
                    
                    popularAuthors()
                    
                    recommendationSection()
                    
                    Spacer()
                    
                       }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Spacer()
                            Text("Discover")
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
          
            }.onAppear {
                homeViewModel.fetchImages()
                homeViewModel.fetchRecentStoriesTab()
                homeViewModel.fetchPopularPublishers()
                homeViewModel.fetchPopularAuthors()
            }
        }
    }
    
    
    func weekTopStoriesSection() -> some View {
        
        VStack {
            HStack(alignment: .center) {
                Text("This Week's Top Stories").font(.title2).fontWeight(.semibold)
                
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
    
    
    func popularPublishers() -> some View {
        
        VStack {
            HStack(alignment: .center) {
                Text("Popular Official Publishers").font(.title2).fontWeight(.semibold)
                
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
                    ForEach(homeViewModel.popularPublishers) { publishers in
                        
                        VStack(spacing:16) {
                            AsyncImage(url: homeViewModel.newsArcticle.first?.url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 30, height: 30)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipShape(RoundedRectangle(cornerRadius: 50)) // Apply rounded corners
                                        .foregroundColor(.white)
                                        .background(Circle()) // Optional, depends on design
                                        .frame(alignment: .center)

                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                        .background(Color.gray.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 8)) // Apply rounded corners
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            
                            Text(publishers.title).font(.title3).fontWeight(.semibold).frame(alignment: .leading).lineLimit(1)
                            
                            ChipView(label: "Following")
                            
                        }.frame(alignment: .leading)
                    }
                }
                .padding([.leading, .trailing, .top])
            }
        }
    }
    
    func popularAuthors() -> some View {
        
        VStack {
            HStack(alignment: .center) {
                Text("Popular Authors").font(.title2).fontWeight(.semibold)
                
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
                    ForEach(homeViewModel.popularAuthors) { authors in
                        
                        VStack(spacing: 16) {
                            AsyncImage(url: homeViewModel.newsArcticle.first?.url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 30, height: 30)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipShape(RoundedRectangle(cornerRadius: 50)) // Apply rounded corners
                                        .foregroundColor(.white)
                                        .background(Circle()) // Optional, depends on design
                                        .frame(alignment: .center)

                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                        .background(Color.gray.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 8)) // Apply rounded corners
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            
                            Text(authors.name).font(.title3).fontWeight(.semibold).frame(alignment: .leading).lineLimit(1)
                            
                            ChipView(label: "Following")
                            
                        }.frame(alignment: .leading)
                    }
                }
                .padding([.leading, .trailing, .top])
            }
        }
    }
    
    func recommendationSection() -> some View {
        
        VStack {
            HStack(alignment: .center) {
                Text("Recommendations for You").font(.title2).fontWeight(.semibold)
                
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
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
