//
//  PublishersRepository.swift
//  newsline
//
//  Created by Sheikh Mohideen on 05/08/24.
//

import Foundation

class PublishersRepository {
    static func getOfficialPublishers() -> [PublishersModel] {
        return [
            PublishersModel(title: "CNN News"),
            PublishersModel(title: "The New York Times"),
            PublishersModel(title: "BBC News"),
            PublishersModel(title: "USA Today"),
            PublishersModel(title: "NBC News"),
            PublishersModel(title: "ABC News")
        ]
    }
}
