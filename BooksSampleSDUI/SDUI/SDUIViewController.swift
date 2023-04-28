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

private let emptyHandler: (URL) -> Void = { _ in }

final class SDUIViewController: UIViewController {

    private let urlHandler: (URL) -> Void
    private let service: DataService
    private let fetchUIActionName: String
    private let logger: Logger

    private lazy var divHostView = SDUIView(components: components)
    private lazy var components = DivKitComponents(
        updateCardAction: nil,
        urlOpener: { [weak self] url in
            self?.urlHandler(url)
        }
    )

    private var cancellables: Set<AnyCancellable> = []

    init(title: String,
         urlHandler: @escaping (URL) -> Void = emptyHandler,
         service: DataService,
         fetchUIActionName: String,
         logger: Logger) {
        self.urlHandler = urlHandler
        self.service = service
        self.fetchUIActionName = fetchUIActionName
        self.logger = logger
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = title
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.95, alpha: 1.0)
        fetchUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        divHostView.frame = view.bounds.inset(by: view.safeAreaInsets)
    }

    private func fetchUI() {
        logger.debug("\(fetchUIActionName) START")

        service.fetchData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.logger.log("\(self.fetchUIActionName) ERROR: \(error)", level: .error)

                case .finished:
                    break
                }
            }, receiveValue: { data in
                self.logger.debug("\(self.fetchUIActionName) SUCCESS, DATA: \(String(decoding: data, as: UTF8.self))")

                self.setData(data)
            }).store(in: &self.cancellables)
    }

    private func setData(_ data: Data) {
        if let cards = try? SDUIJson.loadCards(data) {
            view.addSubview(divHostView)
            divHostView.setData(cards)
        }
    }
}

extension SDUIViewController: UIActionEventPerforming {

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
