//
//  CountryDetailsResponse+Mapper.swift
//  CountriesApp
//
//  Created by Baher Tamer on 03/12/2024.
//

import NetworkLayer

extension [CountryDetailsResponse.Country] {
    func map() throws -> Country {
        guard
            let country = compactMap(map(country:)).first
        else { throw NetworkError.noData }
        return country
    }
}

// MARK: - Private Helpers
extension [CountryDetailsResponse.Country] {
    private func map(country: CountryDetailsResponse.Country) -> Country {
        let currencies = map(currencies: country.currencies)
        let languages = map(languages: country.languages)
        return Country(
            name: country.name?.common ?? "Undefined",
            code: country.cca2,
            capital: country.capital ?? [],
            currencies: currencies,
            languages: languages,
            region: country.region,
            area: country.area,
            population: country.population,
            flagURL: country.flags?.png
        )
    }
    
    private func map(currencies: [String: CountryDetailsResponse.Currency]?) -> [String: String] {
        currencies?.compactMapValues { $0.name } ?? [:]
    }
    
    private func map(languages: [String: String]?) -> [String] {
        languages?.compactMap { $0.value } ?? []
    }
}
