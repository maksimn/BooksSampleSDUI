//
//  NavToBookDetailsRouter.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 28.04.2023.
//

import UIKit

final class NavToBookDetailsRouter<Builder> where Builder: ParametrizedViewControllerBuilder,
                                                  Builder.Parameter == String {

    private weak var navigationController: UINavigationController?
    private let builder: Builder

    init(navigationController: UINavigationController?, builder: Builder) {
        self.navigationController = navigationController
        self.builder = builder
    }

    func navigate(_ url: String) {
        let bookDetailsViewController = builder.build(url)

        navigationController?.pushViewController(bookDetailsViewController, animated: true)
    }
}
