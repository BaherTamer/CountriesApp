//
//  AllCountriesUseCase.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

protocol AllCountriesUseCase: Sendable {
    func execute() async throws -> [Country]
}

final class AllCountriesUseCaseImp: AllCountriesUseCase {
    // MARK: - Inputs
    private let countryRepository: CountryRepository
    
    // MARK: - Life Cycle
    init(countryRepository: CountryRepository) {
        self.countryRepository = countryRepository
    }
    
    // MARK: - Base Functions
    func execute() async throws -> [Country] {
        try await countryRepository.getAllCountries()
    }
}

final class AllCountriesUseCaseStub: AllCountriesUseCase {
    func execute() async throws -> [Country] {
        [
            Country(name: "Egypt", flagEmoji: "🇪🇬"),
            Country(name: "Palestine", flagEmoji: "🇵🇸"),
            Country(name: "Saudi Arabia", flagEmoji: "🇸🇦")
        ]
    }
}
