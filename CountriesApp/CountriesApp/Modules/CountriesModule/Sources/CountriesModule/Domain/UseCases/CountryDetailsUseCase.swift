//
//  CountryDetailsUseCase.swift
//  CountriesApp
//
//  Created by Baher Tamer on 03/12/2024.
//

protocol CountryDetailsUseCase: Sendable {
    func execute(name: String) async throws -> Country
}

final class CountryDetailsUseCaseImp: CountryDetailsUseCase {
    // MARK: - Inputs
    private let countryRepository: CountryRepository
    
    // MARK: - Life Cycle
    init(countryRepository: CountryRepository) {
        self.countryRepository = countryRepository
    }
    
    // MARK: - Base Functions
    func execute(name: String) async throws -> Country {
        try await countryRepository.getCountryDetails(with: name)
    }
}

final class CountryDetailsUseCaseStub: CountryDetailsUseCase {
    func execute(name: String) async throws -> Country {
        Country(
            name: "Palestine",
            capital: [
                "Ramallah",
                "Jerusalem"
            ],
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
    }
}
