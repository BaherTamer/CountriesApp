//
//  CountryDetailsVMTests.swift
//  CountriesApp
//
//  Created by Baher Tamer on 04/12/2024.
//


import Testing
@testable import CountriesModule

@MainActor
struct CountryDetailsVMTests {
    // MARK: - Variables
    private var viewModel: CountryDetailsVM!
    private var routerStub: CountryDetailsRouterStub!
    private var useCaseStub: CountryDetailsUseCaseStub
    
    // MARK: - Life Cycle
    init() async {
        routerStub = CountryDetailsRouterStub()
        useCaseStub = CountryDetailsUseCaseStub()
        viewModel = CountryDetailsVM(
            name: "Palestine",
            router: routerStub,
            countryDetailsUseCase: useCaseStub
        )
    }
    
    // MARK: - Tests
    @Test func getCountryDetailsSuccess() async throws {
        // Given
        #expect(viewModel.state == .initial)
        
        // When
        viewModel.onInit()
        #expect(viewModel.state == .loading)
        try await Task.sleep(nanoseconds: 1_000_000)
        
        // Then
        #expect(viewModel.country != nil)
        #expect(viewModel.state == .loaded)
    }
    
    @Test func getCountryDetailsError() async throws {
        // Given
        useCaseStub.shouldThrowError = true
        #expect(viewModel.state == .initial)
        
        // When
        viewModel.onInit()
        #expect(viewModel.state == .loading)
        try await Task.sleep(nanoseconds: 1_000_000)
        
        // Then
        #expect(viewModel.country == nil)
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
}
