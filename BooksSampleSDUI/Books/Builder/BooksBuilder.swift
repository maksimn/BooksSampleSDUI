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
        let service = service(isMock: true)

        let booksViewController = BooksViewController(
            title: "КНИГИ",
            service: service,
            logger: LoggerImpl(category: "Books")
        )

        return UINavigationController(rootViewController: booksViewController)
    }

    private func service(isMock: Bool) -> BooksSDUIService {
        isMock ? BooksSDUIServiceMock()
               : BooksSDUIServiceImpl(httpClient: HttpClientImpl())
    }
}
