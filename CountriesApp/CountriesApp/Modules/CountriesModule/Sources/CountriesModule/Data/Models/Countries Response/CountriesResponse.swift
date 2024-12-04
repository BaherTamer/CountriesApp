//
//  CountriesResponse.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

struct CountriesResponse {
    struct Country: Decodable {
       let name: Name?
       let flag: String?
    }

    // MARK: - Name
    struct Name: Decodable {
       let common: String?
    }
}
