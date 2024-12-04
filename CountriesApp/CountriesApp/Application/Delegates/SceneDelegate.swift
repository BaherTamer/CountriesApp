//
//  SceneDelegate.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import CountriesModule
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Variables
    var window: UIWindow?

    // MARK: - Base Functions
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        setupRootView(from: scene)
    }
}

// MARK: - Private Helpers
extension SceneDelegate {
    func setupRootView(from scene: UIScene) {
        let factory = CountriesListFactoryImp()
        let view = factory.create()
        let navigationController = UINavigationController(rootViewController: view)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
