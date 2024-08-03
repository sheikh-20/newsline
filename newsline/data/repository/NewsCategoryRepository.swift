//
//  NewsCategory.swift
//  newsline
//
//  Created by Sheikh Mohideen on 03/08/24.
//

import Foundation

class NewsCategoryRepository {
    static func getNewsCategory() -> [NewsCategory] {
        return [
            NewsCategory(img: "🏛️", category: "Politics"),
            NewsCategory(img: "⚽", category: "Sport"),
            NewsCategory(img: "🖥️", category: "Technology"),
            NewsCategory(img: "🚀", category: "Science"),
            NewsCategory(img: "📊", category: "Business"),
            NewsCategory(img: "🧥", category: "Fashion"),
            NewsCategory(img: "🩺", category: "Health"),
            NewsCategory(img: "📺", category: "Entertainment"),
            NewsCategory(img: "💰", category: "Finance"),
            NewsCategory(img: "🌲", category: "Nature"),
            NewsCategory(img: "✈️", category: "Travel"),
            NewsCategory(img: "🚂", category: "Automotive"),
            NewsCategory(img: "🎨", category: "Arts"),
            NewsCategory(img: "👩", category: "Lifestyle"),
            NewsCategory(img: "🎓", category: "Education"),
        ]
    }
}
