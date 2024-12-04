//
//  CountriesListRouter.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import CoreLayer
import UIKit.UIViewController

protocol CountriesListRouter {
    var screenVC: UIViewController? { get set }
    
    @MainActor
    func navigateToCountryDetails(with name: String)
}

final class CountriesListRouterImp: CountriesListRouter {
    weak var screenVC: UIViewController?
    
    @MainActor
    func navigateToCountryDetails(with name: String) {
        let factory = CountryDetailsFactoryImp()
        let viewController = factory.create(countryName: name)
        screenVC?.pushVC(viewController)
    }
}
