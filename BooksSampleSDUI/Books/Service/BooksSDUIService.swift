//
//  BooksSDUIService.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import CoreModule

protocol BooksSDUIService {

    func fetchUIData() -> DataPublisher
}

struct BooksSDUIServiceImpl: BooksSDUIService {

    private let httpClient: HttpClient

    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }

    func fetchUIData() -> DataPublisher {
        httpClient.send(
            Http(
                urlString: "http://maksimn.github.io/elizarov/books-ui.json",
                method: "GET"
            )
        )
        .tryMap {
            guard $0.response.statusCode == 200 else {
                throw _Error.booksSDUIServiceBadRequest
            }

            return $0.data
        }
        .eraseToAnyPublisher()
    }

    private enum _Error: Error {
        case booksSDUIServiceBadRequest
    }
}
