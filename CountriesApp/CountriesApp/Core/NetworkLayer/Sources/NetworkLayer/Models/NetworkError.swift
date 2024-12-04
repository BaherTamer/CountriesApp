//
//  NetworkError.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case noData
    case unknown
}
