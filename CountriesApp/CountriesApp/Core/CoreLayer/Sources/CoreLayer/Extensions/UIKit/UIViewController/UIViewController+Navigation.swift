//
//  UIViewController+Navigation.swift
//  CountriesApp
//
//  Created by Baher Tamer on 03/12/2024.
//

import UIKit.UIViewController

public extension UIViewController {
    func pushVC(_ viewController: UIViewController) {
        navigationController?.pushViewController(
            viewController,
            animated: true
        )
    }
}
