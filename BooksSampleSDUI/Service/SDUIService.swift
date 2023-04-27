//
//  BooksSDUIService.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import CoreModule

protocol SDUIService {

    func fetchUIData() -> DataPublisher
}

struct SDUIServiceImpl: SDUIService {

    private let url: String
    private let httpClient: HttpClient

    init(url: String, httpClient: HttpClient) {
        self.url = url
        self.httpClient = httpClient
    }

    func fetchUIData() -> DataPublisher {
        httpClient.send(
            Http(urlString: url, method: "GET")
        )
        .tryMap {
            guard $0.response.statusCode == 200 else {
                throw _Error.SDUIServiceBadRequest
            }

            return $0.data
        }
        .eraseToAnyPublisher()
    }

    private enum _Error: Error {
        case SDUIServiceBadRequest
    }
}
