//
//  CountriesListFactory.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import SwiftUI

public protocol CountriesListFactory {
    @MainActor
    func create() -> UIViewController
}

public final class CountriesListFactoryImp: CountriesListFactory {
    public init() {}
    
    public func create() -> UIViewController {
        let countryRepository = CountryRepositoryImp()
        let allCountriesUseCase = AllCountriesUseCaseImp(countryRepository: countryRepository)
        let router = CountriesListRouterImp()
        let viewModel = CountriesListVM(
            router: router,
            allCountriesUseCase: allCountriesUseCase
        )
        let view = CountriesListScreen(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: view)
        hostingController.navigationItem.title = String(localized: "All Countries")
        router.screenVC = hostingController
        return hostingController
    }
}
