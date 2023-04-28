//
//  BookDetailsBuilder.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 27.04.2023.
//

import CoreModule
import UIKit

protocol BookDetailsBuilder {

    func build(_ url: String) -> UIViewController
}

struct BookDetailsBuilderImpl: BookDetailsBuilder {

    func build(_ url: String) -> UIViewController {
        let service = service(isMock: true, url)

        let sduiViewController = SDUIViewController(
            title: "Описание",
            urlHandler: { _ in },
            service: service,
            fetchUIActionName: "FETCH BOOK UI FROM \(url)",
            logger: LoggerImpl(category: "BookDetails")
        )

        return sduiViewController
    }

    private func service(isMock: Bool, _ url: String) -> SDUIService {
        isMock ? SDUIServiceMock(url) :
                 SDUIServiceImpl(url: url, httpClient: HttpClientImpl())
    }
}
