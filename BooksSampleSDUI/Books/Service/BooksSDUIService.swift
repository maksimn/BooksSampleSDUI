//
//  BooksSDUIService.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import Combine
import CoreModule
import Foundation

protocol BooksSDUIService {

    func fetchUIData() -> AnyPublisher<Data, Error>
}

struct BooksSDUIServiceImpl: BooksSDUIService {

    private let httpClient: HttpClient

    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }

    func fetchUIData() -> AnyPublisher<Data, Error> {
        httpClient.send(
            Http(
                urlString: "http://maksimn.github.io/elizarov/books-ui.json",
                method: "GET"
            )
        )
        .map { $0.data }
        .eraseToAnyPublisher()
    }
}
