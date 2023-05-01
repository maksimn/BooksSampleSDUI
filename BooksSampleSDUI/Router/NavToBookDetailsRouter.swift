//
//  NavToBookDetailsRouter.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 28.04.2023.
//

import CoreModule
import UIKit

final class NavToBookDetailsRouter<Builder> where Builder: ParametrizedViewControllerBuilder,
                                                  Builder.Parameter == String {

    private weak var navigationController: UINavigationController?
    private let bookDetailsBuilder: Builder

    init(navigationController: UINavigationController?, bookDetailsBuilder: Builder) {
        self.navigationController = navigationController
        self.bookDetailsBuilder = bookDetailsBuilder
    }

    func navigate(_ url: String) {
        let bookDetailsViewController = bookDetailsBuilder.build(url)

        navigationController?.pushViewController(bookDetailsViewController, animated: true)
    }
}
