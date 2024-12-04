//
//  CountriesResponse+Mapper.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

extension [CountriesResponse.Country] {
    func map() -> [Country] {
        compactMap(map(country:))
    }
}

// MARK: - Private Helpers
extension [CountriesResponse.Country] {
    private func map(country: CountriesResponse.Country) -> Country {
        Country(
            name: country.name?.common ?? "Undefined",
            flagEmoji: country.flag ?? "⚠️"
        )
    }
}
