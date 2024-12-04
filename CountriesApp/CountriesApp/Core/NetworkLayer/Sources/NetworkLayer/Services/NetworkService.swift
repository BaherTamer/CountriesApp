//
//  NetworkService.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

public protocol NetworkService {
    func request<T: Decodable & Sendable>(with endpoint: Endpoint) async throws -> T
}
