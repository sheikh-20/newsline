//
//  HomeViewModel.swift
//  newsline
//
//  Created by Sheikh Mohideen on 13/07/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var newsArcticle: [NewsArticle] = []
    @Published var recentStoriesTab: [RecentStoryTab] = []
    @Published var popularPublishers: [PublishersModel] = []
    @Published var popularAuthors: [AuthorsModel] = []
    
    func fetchImages() {
           // Example URLs
           let newsArticles = [
               NewsArticle(
                url: URL(string: "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000MR0044631300503690E01_DXXX.jpg"),
                title: "Revoltionizing the Future: Breakthrough Technology Set to Transform Industries",
                channelName: "Jane Cooper",
                publishedDate: 1725810416079,
                userRead: 378,
                userComment: 2),
               
               NewsArticle(
                url: URL(string: "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000MR0044631300503690E01_DXXX.jpg"),
                title: "Economic Boom on the Horizon: Experts Predict Record Growth in Key Sectors",
                channelName: "NBC News",
                publishedDate: 1725810416079,
                userRead: 852,
                userComment: 3),
               
               NewsArticle(
                url: URL(string: "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000MR0044631300503690E01_DXXX.jpg"),
                title: "Breathrough Discovery: Promising Treatment Shows Potential in Cancer Battle",
                channelName: "Brooklyn Simmons",
                publishedDate: 1725810416079,
                userRead: 1200,
                userComment: 5),
               
               NewsArticle(
                url: URL(string: "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000MR0044631300503690E01_DXXX.jpg"),
                title: "Revoltionizing the Future: Breakthrough Technology Set to Transform Industries",
                channelName: "Jane Cooper",
                publishedDate: 1725810416079,
                userRead: 378,
                userComment: 2),
               
               NewsArticle(
                url: URL(string: "https://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000MR0044631300503690E01_DXXX.jpg"),
                title: "Innovation Unleashed: Groundbreaking Tech Unveiled at Global Summit",
                channelName: "BBC News",
                publishedDate: 1725810416079,
                userRead: 1300,
                userComment: 2),
           ]
           
           // Map strings to URL
           self.newsArcticle = newsArticles
       }
    
    func fetchRecentStoriesTab() {
        self.recentStoriesTab = ["All", "Politics", "Technology", "Business", "Science"].map { RecentStoryTab(text: $0) }
    }
    
    func fetchPopularPublishers() {
        self.popularPublishers = [PublishersModel(title: "CNN News"),
                                    PublishersModel(title: "The New York Times"),
                                    PublishersModel(title: "BBC News"),
                                    PublishersModel(title: "USA Today"),
                                    PublishersModel(title: "NBC News"),
                                    PublishersModel(title: "ABC News")]
    }
    
    func fetchPopularAuthors() {
        self.popularAuthors = [
            AuthorsModel(name: "Jenny W."),
            AuthorsModel(name: "Edgar T."),
            AuthorsModel(name: "Krishna B."),
            AuthorsModel(name: "Clinton M."),
            AuthorsModel(name: "Sheikh M."),
        ]
    }
}
