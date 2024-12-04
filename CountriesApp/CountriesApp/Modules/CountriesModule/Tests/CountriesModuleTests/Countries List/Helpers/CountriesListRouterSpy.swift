//
//  CountriesListRouterSpy.swift
//  CountriesApp
//
//  Created by Baher Tamer on 04/12/2024.
//

import UIKit.UIViewController
@testable import CountriesModule

final class CountriesListRouterSpy: CountriesListRouter {
    // MARK: - Variables
    var screenVC: UIViewController?
    var didNavigateToCountryDetails = false
    var navigatedCountryName: String?
    
    // MARK: - Functions
    func navigateToCountryDetails(with name: String) {
        didNavigateToCountryDetails = true
        navigatedCountryName = name
    }
}
