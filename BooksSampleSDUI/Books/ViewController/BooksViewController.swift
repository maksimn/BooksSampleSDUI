//
//  BooksViewController.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import Combine
import CoreModule
import DivKit
import LayoutKit
import UIKit

final class BooksViewController: UIViewController {

    private let service: BooksSDUIService
    private let logger: Logger

    private lazy var divHostView = DivHostView(components: components)
    private lazy var components = DivKitComponents(
        updateCardAction: nil,
        urlOpener: { [weak self] url in
            self?.process(url)
        }
    )

    private var cancellables: Set<AnyCancellable> = []

    init(title: String, service: BooksSDUIService, logger: Logger) {
        self.service = service
        self.logger = logger
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        logger.debug("FETCH BOOKS UI START")

        service.fetchUIData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.logger.log("FETCH BOOKS UI ERROR: \(error)", level: .error)

                case .finished:
                    break
                }
            }, receiveValue: { data in
                self.logger.debug("FETCH BOOKS UI SUCCESS, DATA: \(String(decoding: data, as: UTF8.self))")

                self.setData(data)
            }).store(in: &self.cancellables)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        divHostView.frame = view.bounds.inset(by: view.safeAreaInsets)
    }

    private func setData(_ data: Data) {
        if let cards = try? DivJson.loadCards(data) {
            view.addSubview(divHostView)
            divHostView.setData(cards)
        }
    }

    private func process(_ url: URL) {
        logger.debug("\(url)")
    }
}

extension BooksViewController: UIActionEventPerforming {

    func perform(uiActionEvent event: UIActionEvent, from _: AnyObject) {
        switch event.payload {
        case let .divAction(params):
            components.handleActions(params: params)
            divHostView.reloadItem(cardId: params.cardId)
        case .empty,
             .url,
             .menu,
             .json,
             .composite:
            break
        }
    }
}
