//
//  BooksBuilder.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import CoreModule
import UIKit

struct BooksBuilder: ViewControllerBuilder {

    func build() -> UIViewController {
        let config = Config(isDataServiceMocked: false)
        let navigationController = UINavigationController()
        let router = NavToBookDetailsRouter(
            navigationController: navigationController,
            bookDetailsBuilder: BookDetailsBuilder(config: config)
        )

        let sduiDependency = SDUIDependency(
            title: "КНИГИ",
            url: "http://maksimn.github.io/elizarov/books-ui.json",
            urlOpener: { url in
                router.navigate(url.absoluteString)
            },
            config: config
        )
        let sduiBuilder = SDUIBuilder(dependency: sduiDependency)
        let sduiViewController = sduiBuilder.build()

        navigationController.setViewControllers([sduiViewController], animated: false)

        return navigationController
    }
}
