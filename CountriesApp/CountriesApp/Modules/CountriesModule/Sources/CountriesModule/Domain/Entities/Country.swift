//
//  Country.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import Foundation

struct Country: Hashable, Identifiable {
    let id = UUID().uuidString
    let name: String
    var flagEmoji: String = ""
    var code: String?
    var capital: [String] = []
    var currencies: [String: String] = [:]
    var languages: [String] = []
    var region: String?
    var area: Int?
    var population: Int?
    var flagURL: String?
}

extension Country {
    var capitalFormatted: String {
        capital.joined(separator: ", ")
    }
    
    var languagesFormatted: String {
        languages.joined(separator: ", ")
    }
    
    var currenciesFormatted: String {
        currencies.map {
            "\($0.value) (\($0.key))"
        }
        .joined(separator: "\n")
    }
}
