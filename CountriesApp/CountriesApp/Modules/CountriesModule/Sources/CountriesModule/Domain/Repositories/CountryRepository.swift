//
//  CountryRepository.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

protocol CountryRepository: Sendable {
    func getAllCountries() async throws -> [Country]
    func getCountryDetails(with name: String) async throws -> Country
}
