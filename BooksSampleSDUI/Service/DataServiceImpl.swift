//
//  DataServiceImpl.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 01.05.2023.
//

import CoreModule

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
