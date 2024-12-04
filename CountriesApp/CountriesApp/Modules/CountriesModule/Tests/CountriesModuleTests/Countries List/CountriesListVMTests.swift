//
//  CountriesListVMTests.swift
//  CountriesAppTests
//
//  Created by Baher Tamer on 03/12/2024.
//

import Testing
@testable import CountriesModule

@MainActor
struct CountriesListVMTests {
    // MARK: - Variables
    private var viewModel: CountriesListVM!
    private var routerSpy: CountriesListRouterSpy!
    private var useCaseStub: AllCountriesUseCaseStub!
    
    // MARK: - Life Cycle
    init() async {
        routerSpy = CountriesListRouterSpy()
        useCaseStub = AllCountriesUseCaseStub()
        viewModel = CountriesListVM(
            router: routerSpy,
            allCountriesUseCase: useCaseStub
        )
    }
    
    // MARK: - Tests
    @Test func getCountriesSuccess() async throws {
        // Given
        #expect(viewModel.state == .initial)
        
        // When
        viewModel.onInit()
        #expect(viewModel.state == .loading)
        try await Task.sleep(nanoseconds: 1_000_000)
        
        // Then
        #expect(viewModel.countries.count == 3)
        #expect(viewModel.state == .loaded)
    }
    
    @Test func getCountriesEmpty() async throws {
        // Given
        useCaseStub.response = []
        #expect(viewModel.state == .initial)
        
        // When
        viewModel.onInit()
        #expect(viewModel.state == .loading)
        try await Task.sleep(nanoseconds: 1_000_000)
        
        // Then
        #expect(viewModel.countries.isEmpty)
        #expect(viewModel.state == .empty)
    }
    
    @Test func getCountriesError() async throws {
        // Given
        useCaseStub.shouldThrowError = true
        #expect(viewModel.state == .initial)
        
        // When
        viewModel.onInit()
        #expect(viewModel.state == .loading)
        try await Task.sleep(nanoseconds: 1_000_000)
        
        // Then
        #expect(viewModel.countries.isEmpty)
        #expect(viewModel.state == .error)
    }
    
    @Test func onRefresh() async throws {
        // Given
        viewModel.onInit()
        try await Task.sleep(nanoseconds: 1_000_000)
        
        // When
        #expect(viewModel.state != .initial)
        viewModel.onRefresh()
        
        // Then
        #expect(viewModel.state == .initial)
    }
    
    @Test func errorAction() async throws {
        // Given
        useCaseStub.shouldThrowError = true
        viewModel.onInit()
        try await Task.sleep(nanoseconds: 1_000_000)
        
        // When
        #expect(viewModel.state == .error)
        viewModel.errorAction()
        
        // Then
        #expect(viewModel.state == .initial)
    }
    
    @Test func navigateToDetails() async throws {
        // Given
        let country = Country(name: "Palestine", flagEmoji: "🇵🇸")
        
        // When
        viewModel.didSelectCountry(country)
        
        // Then
        #expect(routerSpy.didNavigateToCountryDetails)
        #expect(routerSpy.navigatedCountryName == country.name)
    }
}
