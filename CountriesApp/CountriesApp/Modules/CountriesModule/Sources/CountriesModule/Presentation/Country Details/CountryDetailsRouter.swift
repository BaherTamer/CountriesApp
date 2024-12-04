//
//  CountryDetailsRouter.swift
//  CountriesApp
//
//  Created by Baher Tamer on 03/12/2024.
//

import UIKit.UIViewController

protocol CountryDetailsRouter {
    var screenVC: UIViewController? { get set }
}

final class CountryDetailsRouterImp: CountryDetailsRouter {
    weak var screenVC: UIViewController?
}
