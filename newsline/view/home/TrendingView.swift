//
//  TrendingView.swift
//  newsline
//
//  Created by Sheikh Mohideen on 25/09/24.
//

import Foundation
import SwiftUI

struct TrendingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            trendingNewsUI()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            
            ToolbarItem(placement: .principal) {
                HStack {
                    Spacer()
                    Text("Trending")
                        .font(.headline)
                    Spacer()
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
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
        .onAppear {
            homeViewModel.fetchImages()
            homeViewModel.fetchBookmarkTab()
        }
    }
    
    func trendingNewsUI() -> some View {
        
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

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
    }
}
