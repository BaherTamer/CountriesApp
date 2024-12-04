//
//  CountryDetailsUseCaseStub.swift
//  CountriesApp
//
//  Created by Baher Tamer on 04/12/2024.
//

import NetworkLayer
@testable import CountriesModule

final class CountryDetailsUseCaseStub: CountryDetailsUseCase {
    // MARK: - Variables
    nonisolated(unsafe) var response: Country = {
        Country(
            name: "Palestine",
            capital: ["Ramallah", "Jerusalem"],
            currencies: [
                "EGP": "Egyptian pound",
                "ILS": "Israeli new shekel",
                "JOD": "Jordanian dinar"
            ],
            languages: ["Arabic"],
            region: "Asia",
            area: 6220,
            population: 4803269,
            flagURL: "https://flagcdn.com/w320/ps.png"
        )
    }()
    
    nonisolated(unsafe) var shouldThrowError = false
    
    // MARK: - Base Functions
    func execute(name: String) async throws -> Country {
        if shouldThrowError {
            throw NetworkError.unknown
        }
        return response
    }
}
