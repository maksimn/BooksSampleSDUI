//
//  BooksSDUIService.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import CoreModule

protocol DataService {

    func fetchData() -> DataPublisher
}

func service(isMock: Bool = false, _ url: String) -> DataService {
    isMock ? DataServiceMock(url) :
             DataServiceImpl(url: url, httpClient: HttpClientImpl())
}

struct DataServiceImpl: DataService {

    private let url: String
    private let httpClient: HttpClient

    init(url: String, httpClient: HttpClient) {
        self.url = url
        self.httpClient = httpClient
    }

    func fetchData() -> DataPublisher {
        httpClient.send(
            Http(urlString: url, method: "GET")
        )
        .tryMap {
            guard $0.response.statusCode == 200 else {
                throw _Error.DataServiceBadRequest
            }

            return $0.data
        }
        .eraseToAnyPublisher()
    }

    private enum _Error: Error {
        case DataServiceBadRequest
    }
}
