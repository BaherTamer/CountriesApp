//
//  CountryRepositoryImp.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import NetworkLayer

final class CountryRepositoryImp: CountryRepository {
    // MARK: - Variables
    @NetworkActor
    private var service: RESTNetworkService {
        RESTNetworkService.shared
    }
    
    // MARK: - Base Functions
    func getAllCountries() async throws -> [Country] {
        let endpoint = AllCountriesEndpoint()
        let countries: [CountriesResponse.Country] = try await service.request(with: endpoint)
        return countries
            .map()
            .filter { !($0.name.contains("Israel")) }
            .sorted { $0.name < $1.name }
    }
    
    func getCountryDetails(with name: String) async throws -> Country {
        let endpoint = CountryDetailsEndpoint(name: name)
        let response: [CountryDetailsResponse.Country] = try await service.request(with: endpoint)
        let country = try response.map()
        return country
    }
}
