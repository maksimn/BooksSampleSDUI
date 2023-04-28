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

        let sduiViewController = SDUIViewController(
            title: "КНИГИ",
            urlHandler: { url in
                let bookDetailsBuilder = BookDetailsBuilderImpl()
                let bookDetailsViewController = bookDetailsBuilder.build(url.absoluteString)

                navigationController.pushViewController(bookDetailsViewController, animated: true)
            },
            service: service,
            fetchUIActionName: "FETCH BOOKS UI",
            logger: LoggerImpl(category: "Books")
        )

        navigationController.setViewControllers([sduiViewController], animated: false)

        return navigationController
    }
}
