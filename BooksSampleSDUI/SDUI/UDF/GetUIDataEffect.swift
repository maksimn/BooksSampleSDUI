//
//  GetUIDataEffect.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 02.05.2023.
//

import Combine
import CoreModule
import UDF

final class GetUIDataEffect: SideEffectProtocol {

    private let url: String
    private let service: DataService
    private let logger: Logger

    private var cancellables: Set<AnyCancellable> = []

    init(url: String, service: DataService, logger: Logger) {
        self.url = url
        self.service = service
        self.logger = logger
    }

    func execute(with: ActionDispatcher) {
        let url = self.url

        logger.debug("FETCH UI FROM \(url) START")

        service.fetchData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.logger.log("FETCH UI FROM \(url) ERROR: \(error)", level: .error)

                case .finished:
                    break
                }
            }, receiveValue: { data in
                self.logger.debug("FETCH UI FROM \(url) SUCCESS, DATA: \(String(decoding: data, as: UTF8.self))")

                with.dispatch(SDUI.Action.uiDataFetched(data))
            }).store(in: &self.cancellables)
    }
}

