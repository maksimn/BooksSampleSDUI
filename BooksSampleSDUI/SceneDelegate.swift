//
//  SceneDelegate.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 13.04.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let booksBuilder = BooksBuilder()

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = booksBuilder.build()
        window?.makeKeyAndVisible()
    }
}
