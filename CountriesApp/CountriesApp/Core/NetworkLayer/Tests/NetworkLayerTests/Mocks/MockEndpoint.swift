//
//  MockEndpoint.swift
//  NetworkLayer
//
//  Created by Baher Tamer on 08/12/2024.
//

@testable import NetworkLayer

struct MockEndpoint: Endpoint {
    var path: String {
        "test/path"
    }
    
    var method: NetworkLayer.HTTPMethod {
        .get
    }
}
