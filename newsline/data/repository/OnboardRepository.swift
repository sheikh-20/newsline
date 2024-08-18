//
//  OnboardRepository.swift
//  newsline
//
//  Created by Sheikh Mohideen on 18/08/24.
//

import Foundation

class OnboardRepository {
    static func getOnboardContent() -> [OnboardModel] {
        return [
            OnboardModel(title: "Stay Informed, Anytime, Anywhere", subTitle: "Welcome to our news app, your go-to source for breaking news, exclusive stories and personalized content."),
            OnboardModel(title: "Be a Knowledgeable", subTitle: "Unlock a personalized news experience that matches your interests and preferences. Your news, your way!"),
            OnboardModel(title: "Elevate Your News Experience Now!", subTitle: "Join our vibrant community of news enthusiats. Share your thoughts and engage in meaningful discussions")
        ]
    }
}
