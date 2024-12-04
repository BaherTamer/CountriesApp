//
//  NetworkConfig.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import Foundation

enum NetworkConfig {
    static let baseURL = Bundle.main.object(
        forInfoDictionaryKey: "BASE_URL"
    ) as? String ?? ""
}
