//
//  NavToBookDetailsRouter.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 28.04.2023.
//

import UIKit

final class NavToBookDetailsRouter<Builder> where Builder: ParamViewControllerBuilder, Builder.Param == String {

    private weak var navigationController: UINavigationController?
    private let builder: Builder

    init(navigationController: UINavigationController?, builder: Builder) {
        self.navigationController = navigationController
        self.builder = builder
    }

    func navigate(_ param: String) {
        let bookDetailsViewController = builder.build(param)

        navigationController?.pushViewController(bookDetailsViewController, animated: true)
    }
}
