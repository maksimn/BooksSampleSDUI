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
        let url = "http://maksimn.github.io/elizarov/books-ui.json"

        let service = service(url)
        let navigationController = UINavigationController()
        let router = NavToBookDetailsRouter(
            navigationController: navigationController,
            bookDetailsBuilder: BookDetailsBuilder()
        )

        let sduiViewController = SDUIViewController(
            title: "КНИГИ",
            urlHandler: { url in
                router.navigate(url.absoluteString)
            },
            service: service,
            fetchUIActionName: "FETCH BOOKS UI",
            logger: LoggerImpl(category: "Books")
        )

        navigationController.setViewControllers([sduiViewController], animated: false)

        return navigationController
    }
}
