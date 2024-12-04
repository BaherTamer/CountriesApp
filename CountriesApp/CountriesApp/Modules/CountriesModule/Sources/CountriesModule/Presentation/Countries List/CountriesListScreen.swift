//
//  CountriesListScreen.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import CoreLayer
import SwiftUI

struct CountriesListScreen: View {
    // MARK: - Inputs
    var viewModel: CountriesListVM
    
    // MARK: - Body
    var body: some View {
        ZStack {
            stateViews
        }
    }
    
    @ViewBuilder
    private var stateViews: some View {
        switch viewModel.state {
        case .initial:
            Color.clear
                .onAppear(perform: viewModel.onInit)
        case .loading:
            ProgressView()
        case .error:
            ErrorScreen(action: viewModel.errorAction)
        case .empty:
            EmptyScreen(content: viewModel.emptyContent)
        case .loaded:
            contentView
        }
    }
}

// MARK: - SubViews
extension CountriesListScreen {
    private var contentView: some View {
        List(
            viewModel.countries,
            rowContent: countryRow
        )
        .refreshable(action: viewModel.onRefresh)
    }
    
    private func countryRow(_ country: Country) -> some View {
        CountryRowView(country: country) {
            viewModel.didSelectCountry(country)
        }
    }
}

// MARK: - Preview
#Preview {
    CountriesListScreen(
        viewModel: CountriesListVM(
            router: CountriesListRouterImp(),
            allCountriesUseCase: AllCountriesUseCaseStub()
        )
    )
}
