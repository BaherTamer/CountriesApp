//
//  AllCountriesUseCaseStub.swift
//  CountriesApp
//
//  Created by Baher Tamer on 04/12/2024.
//

@testable import CountriesModule
import NetworkLayer

final class AllCountriesUseCaseStub: AllCountriesUseCase {
    // MARK: - Variables
    nonisolated(unsafe) var response: [Country] = {
        [
            Country(name: "Egypt", flagEmoji: "🇪🇬"),
            Country(name: "Palestine", flagEmoji: "🇵🇸"),
            Country(name: "Saudi Arabia", flagEmoji: "🇸🇦")
        ]
    }()
    
    nonisolated(unsafe) var shouldThrowError = false
    
    // MARK: - Base Functions
    func execute() async throws -> [Country] {
        if shouldThrowError {
            throw NetworkError.unknown
        }
        
        return response
    }
}
