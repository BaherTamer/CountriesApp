//
//  CountryDetailsFactory.swift
//  CountriesApp
//
//  Created by Baher Tamer on 03/12/2024.
//

import SwiftUI

public protocol CountryDetailsFactory {
    @MainActor
    func create(countryName: String) -> UIViewController
}

final class CountryDetailsFactoryImp: CountryDetailsFactory {
    public init() {}
    
    public func create(countryName: String) -> UIViewController {
        let countryRepository = CountryRepositoryImp()
        let countryDetailsUseCase = CountryDetailsUseCaseImp(countryRepository: countryRepository)
        let router = CountryDetailsRouterImp()
        let viewModel = CountryDetailsVM(
            name: countryName,
            router: router,
            countryDetailsUseCase: countryDetailsUseCase
        )
        let view = CountryDetailsScreen(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: view)
        hostingController.navigationItem.title = countryName
        router.screenVC = hostingController
        return hostingController
    }
}
