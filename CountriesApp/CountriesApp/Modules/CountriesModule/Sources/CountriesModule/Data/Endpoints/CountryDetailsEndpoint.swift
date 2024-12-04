//
//  CountryDetailsEndpoint.swift
//  CountriesApp
//
//  Created by Baher Tamer on 03/12/2024.
//

import NetworkLayer

struct CountryDetailsEndpoint: Endpoint {
    // MARK: - Inputs
    let name: String
    
    // MARK: - Variables
    var path: String {
        "name/\(name)"
    }
    
    var method: HTTPMethod {
        .get
    }
}
