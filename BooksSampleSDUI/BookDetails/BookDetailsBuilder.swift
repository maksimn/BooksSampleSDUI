//
//  BookDetailsBuilder.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 27.04.2023.
//

import CoreModule
import UIKit

struct BookDetailsBuilder: ParamViewControllerBuilder {

    func build(_ param: String) -> UIViewController {
        let service = service(param)

        let sduiViewController = SDUIViewController(
            title: "Описание",
            urlHandler: { _ in },
            service: service,
            fetchUIActionName: "FETCH BOOK UI FROM \(param)",
            logger: LoggerImpl(category: "BookDetails")
        )

        return sduiViewController
    }
}
