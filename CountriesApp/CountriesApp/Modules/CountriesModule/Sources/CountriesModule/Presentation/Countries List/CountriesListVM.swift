//
//  CountriesListVM.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import CoreLayer
import Observation

@Observable @MainActor
final class CountriesListVM {
    // MARK: - Inputs
    private let router: CountriesListRouter
    private let allCountriesUseCase: AllCountriesUseCase
    
    // MARK: - Constants
    let emptyContent = EmptyContent(
        icon: "globe.europe.africa.fill",
        title: "No countries was found"
    )
    
    // MARK: - Variables
    private(set) var state = ViewState.initial
    private(set) var countries: [Country] = []
    
    // MARK: - Life Cycle
    init(
        router: CountriesListRouter,
        allCountriesUseCase: AllCountriesUseCase
    ) {
        self.router = router
        self.allCountriesUseCase = allCountriesUseCase
    }
    
    func onInit() {
        getCountries()
    }
    
    func errorAction() {
        state = .initial
    }
    
    func onRefresh() {
        state = .initial
    }
}

// MARK: - Core Functions
extension CountriesListVM {
    func didSelectCountry(_ country: Country) {
        router.navigateToCountryDetails(
            with: country.name
        )
    }
}

// MARK: - Private Helpers
extension CountriesListVM {
    private func getCountries() {
        state = .loading
        Task {
            do {
                let fetchedCountries = try await allCountriesUseCase.execute()
                handleResponse(fetchedCountries)
            } catch {
                handleError(error)
            }
        }
    }
    
    private func handleResponse(_ response: [Country]) {
        countries = response
        state = countries.isEmpty ? .empty : .loaded
    }
    
    private func handleError(_ error: any Error) {
        print("ERROR: \(error)")
        state = .error
    }
}
