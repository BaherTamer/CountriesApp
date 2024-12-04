//
//  AllCountriesEndpoint.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import NetworkLayer

struct AllCountriesEndpoint: Endpoint {
    // MARK: - Variables
    var path: String {
        "all"
    }
    
    var method: HTTPMethod {
        .get
    }
}
