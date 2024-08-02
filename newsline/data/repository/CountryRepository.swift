//
//  CountryRepository.swift
//  newsline
//
//  Created by Sheikh Mohideen on 02/08/24.
//

import Foundation

class CountryRepository {
    static func getCountries() -> [Country] {
        return [
            Country(name: "United States", flag: "🇺🇸"),
            Country(name: "Canada", flag: "🇨🇦"),
            Country(name: "Germany", flag: "🇩🇪"),
            Country(name: "France", flag: "🇫🇷"),
            Country(name: "United Kingdom", flag: "🇬🇧")
        ]
    }
}
