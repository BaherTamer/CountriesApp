//
//  CountryDetailsResponse.swift
//  CountriesApp
//
//  Created by Baher Tamer on 03/12/2024.
//

import Foundation

struct CountryDetailsResponse {
    struct Country: Decodable {
        let name: Name?
        let cca2: String?
        let currencies: [String: Currency]?
        let capital: [String]?
        let region: String?
        let languages: [String: String]?
        let area, population: Int?
        let flags: Flag?
    }

    // MARK: - Name
    struct Name: Decodable {
       let common: String?
    }
    
    // MARK: - Flag
    struct Flag: Decodable {
        let png: String?
    }
    
    // MARK: - Currency
    struct Currency: Decodable {
        let name: String?
    }
}
