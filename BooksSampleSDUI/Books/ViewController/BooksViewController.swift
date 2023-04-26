//
//  BooksViewController.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import Combine
import DivKit
import LayoutKit
import UIKit

final class BooksViewController: UIViewController {

    private let service: BooksSDUIService

    private lazy var divHostView = DivHostView(components: components)
    private let components = DivKitComponents(
        updateCardAction: nil,
        urlOpener: { UIApplication.shared.open($0) }
    )

    private var cancellables: Set<AnyCancellable> = []

    init(service: BooksSDUIService) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        service.fetchUIData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in

            }, receiveValue: { data in
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
