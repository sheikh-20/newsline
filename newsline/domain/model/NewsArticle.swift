//
//  ImageModel.swift
//  newsline
//
//  Created by Sheikh Mohideen on 16/07/24.
//

import Foundation

struct NewsArticle: Identifiable {
    let id = UUID()
    let url: URL?
    let title: String
    let channelName: String
    let publishedDate: Int64
    let userRead: Int
    let userComment: Int
}
