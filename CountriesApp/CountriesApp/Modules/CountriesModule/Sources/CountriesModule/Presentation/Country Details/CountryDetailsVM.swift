//
//  CountryDetailsVM.swift
//  CountriesApp
//
//  Created by Baher Tamer on 03/12/2024.
//

import CoreLayer
import Observation

@Observable @MainActor
final class CountryDetailsVM {
    // MARK: - Inputs
    private let name: String
    private let router: CountryDetailsRouter
    private let countryDetailsUseCase: CountryDetailsUseCase
    
    // MARK: - Variables
    private(set) var state = ViewState.initial
    private(set) var country: Country?
    
    // MARK: - Life Cycle
    init(
        name: String,
        router: CountryDetailsRouter,
        countryDetailsUseCase: CountryDetailsUseCase
    ) {
        self.name = name
        self.router = router
        self.countryDetailsUseCase = countryDetailsUseCase
    }
    
    func onInit() {
        getCountryDetails()
    }
    
    func errorAction() {
        state = .initial
    }
    
    func onRefresh() {
        state = .initial
    }
}

// MARK: - Private Helpers
extension CountryDetailsVM {
    private func getCountryDetails() {
        state = .loading
        Task {
            do {
                let fetchedCountry = try await countryDetailsUseCase.execute(name: name)
                handleResponse(fetchedCountry)
            } catch {
                handleError(error)
            }
        }
    }
    
    private func handleResponse(_ response: Country) {
        country = response
        state = .loaded
    }
    
    private func handleError(_ error: any Error) {
        print("ERROR: \(error)")
        state = .error
    }
}
