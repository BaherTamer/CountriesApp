//
//  CountryDetailsScreen.swift
//  CountriesApp
//
//  Created by Baher Tamer on 03/12/2024.
//

import CoreLayer
import SwiftUI

struct CountryDetailsScreen: View {
    // MARK: - Inputs
    var viewModel: CountryDetailsVM
    
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
        case .loaded:
            contentView
        default:
            ErrorScreen(action: viewModel.errorAction)
        }
    }
}

// MARK: - SubViews
extension CountryDetailsScreen {
    private var contentView: some View {
        ScrollView {
            VStack {
                countryFlag
                CountryInfoView(country: viewModel.country)
                    .padding()
            }
        }
        .scrollIndicators(.hidden)
    }
    
    private var countryFlag: some View {
        CountryFlagView(
            urlString: viewModel.country?.flagURL
        )
    }
}

// MARK: - Preview
#Preview {
    CountryDetailsScreen(
        viewModel: CountryDetailsVM(
            name: "Palestine",
            router: CountryDetailsRouterImp(),
            countryDetailsUseCase: CountryDetailsUseCaseStub()
        )
    )
}
