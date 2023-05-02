//
//  BookDetailsBuilder.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 27.04.2023.
//

import CoreModule
import UIKit

struct BookDetailsBuilder: ParametrizedViewControllerBuilder {

    private let config: Config

    init(config: Config) {
        self.config = config
    }

    func build(_ url: String) -> UIViewController {
        let empty: (URL) -> Void = { _ in }
        let sduiDependency = SDUIDependency(
            title: "Описание",
            url: url,
            urlOpener: empty,
            config: config
        )
        let sduiBuilder = SDUIBuilder(dependency: sduiDependency)
        let sduiViewController = sduiBuilder.build()

        return sduiViewController
    }
}
